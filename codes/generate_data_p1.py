import random


def generate_data(n_asm, n_sam, h=0.99, beta=100, seed=None):
    if seed is not None:
        random.seed(seed)

    asm_list = [f"ASM{i+1}" for i in range(n_asm)]
    sam_real = [f"SAM{i+1}" for i in range(n_sam)]
    sam_artificial = ["SAM_art"]
    sam_all = sam_real + sam_artificial

    lines = []
    lines.append(f"set ASM := {' '.join(asm_list)};")
    lines.append(f"set SAM_real := {' '.join(sam_real)};")
    lines.append(f"set SAM_artificial := {' '.join(sam_artificial)};")
    lines.append("")
    lines.append(f"param beta := {beta};")
    lines.append("")

    # param p
    lines.append("param p : " + "  ".join(sam_all) + " :=")
    for asm in asm_list:
        row = [asm]
        for sam in sam_real:
            row.append(f"{round(random.uniform(0.5, 0.9), 2)}")
        row.append("0.1")  # artificial SAM constant
        lines.append("    " + "    ".join(row))
    lines.append(";")
    lines.append("")

    # param d
    lines.append("param d :=")
    for sam in sam_real:
        lines.append(f"    {sam}    {random.randint(3, 7)}")
    lines.append(f"    SAM_art    100;")
    lines.append("")

    # param s
    lines.append("param s :=")
    for asm in asm_list:
        lines.append(f"    {asm}    {random.randint(2, 4)}")
    lines.append(";")
    lines.append("")

    # param h
    lines.append("param h :=")
    for asm in asm_list:
        lines.append(f"    {asm}    {h}")
    lines.append(";")

    return "\n".join(lines)


def write_data_file(n_asm, n_sam, h=0.99, beta=100, seed=None):
    data = generate_data(n_asm, n_sam, h, beta, seed)
    filename = f"data_p1_asm{n_asm}_sam{n_sam}_h{str(h).replace('.', '')}.dat"
    with open(filename, "w") as f:
        f.write(data)
    print(f" Data file written to: {filename}")


# Example
write_data_file(3, 2, h=0.99, seed=42)
