import re
from collections import defaultdict

def parse_id(attr):
    m = re.search(r'ID=([^;]+)', attr)
    return m.group(1) if m else None

def replace_id(attr, old, new):
    return re.sub(r'ID=%s([;]|$)' % re.escape(old), 'ID=%s\\1' % new, attr)

def replace_parent(attr, old, new):
    return re.sub(r'Parent=%s([,;]|$)' % re.escape(old), 'Parent=%s\\1' % new, attr)

def preprocess_lines(input_file):
    """去空行、去完全重复行，保留原始顺序"""
    seen = set()
    output_lines = []
    with open(input_file) as fin:
        for line in fin:
            if line.strip() == '':
                continue  # 跳过空行
            if line not in seen:
                output_lines.append(line)
                seen.add(line)
    return output_lines

def process_gff3(input_file, output_file):
    # Step 0: 去空行、去重
    cleaned_lines = preprocess_lines(input_file)

    # Step 1: 读取并分块（gene块切分）
    gene_blocks = []
    current_block = []
    comment_lines = []

    for line in cleaned_lines:
        if line.startswith('#'):
            comment_lines.append(line)
            continue
        fields = line.rstrip().split('\t')
        if fields[2] == 'gene':
            if current_block:
                gene_blocks.append(current_block)
                current_block = []
        current_block.append(fields)
    if current_block:
        gene_blocks.append(current_block)

    # Step 2: 按 (gene_id, start, end) 分组，每组可能有多个来源
    block_map = defaultdict(list)  # key=(gene_id, start, end), value=[block1, block2...]
    for block in gene_blocks:
        gene = block[0]
        attr = gene[8]
        gene_id = parse_id(attr)
        start, end = gene[3], gene[4]
        source = gene[1]
        key = (gene_id, start, end)
        block_map[key].append((block, source))

    # Step 3: 决定保留哪些block，并收集不同区间用于后续编号
    geneid_intervals = defaultdict(list)  # gene_id -> list of (start, end, block, source)
    for key, blocklist in block_map.items():
        gene_id, start, end = key
        # 优先保留 transdecoder
        kept = None
        for block, source in blocklist:
            if source == "transdecoder":
                kept = (block, source)
                break
        if not kept:
            kept = blocklist[0]  # 没有transdecoder就保留第一个
        block, source = kept
        geneid_intervals[gene_id].append((start, end, block, source))

    # Step 4: 处理不同区间的gene_id（为重复ID重新编号，且同步下游feature）
    output_rows = []
    for gene_id, blocks in geneid_intervals.items():
        # 以起始位点排序，保证顺序
        sorted_blocks = sorted(blocks, key=lambda x: (int(x[0]), int(x[1])))
        first = True
        for idx, (start, end, block, source) in enumerate(sorted_blocks):
            if first:
                # 第一个区间，直接输出
                for row in block:
                    output_rows.append('\t'.join(row))
                first = False
            else:
                # 其它区间，重新编号
                new_gene_id = f"{gene_id}_{idx}"
                # gene行改ID
                row = block[0]
                row[8] = replace_id(row[8], gene_id, new_gene_id)
                output_rows.append('\t'.join(row))
                # 下游feature改Parent/ID
                for row in block[1:]:
                    if 'Parent=' in row[8]:
                        row[8] = replace_parent(row[8], gene_id, new_gene_id)
                    if 'ID=' in row[8]:
                        row[8] = replace_id(row[8], gene_id, new_gene_id)
                    output_rows.append('\t'.join(row))

    # Step 5: 输出到文件（保留注释）
    with open(output_file, 'w') as fout:
        for cl in comment_lines:
            fout.write(cl)
        for line in output_rows:
            fout.write(line + '\n')

if __name__ == "__main__":
    process_gff3(
        '/share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome/Aco.CycloneSeq.opt.gff3',
        '/share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome/Aco.CycloneSeq.optimized.gff3'
    )