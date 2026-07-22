# Z80 Coding Style & Layout Guidelines

This document outlines the standard column layout, formatting rules, and visual guidelines for Z80 assembly source files across our arcade disassembly projects. 

These standards exist to encourage a consistent, highly readable codebase for study, preservation, and future development.

---

| 🚨 A Note on Flexibility |
| :--- |
| **These formatting standards are meant for guidance, not to force you into a coding straitjacket.** While a consistent layout is highly encouraged as a best practice, you are free to make exceptions without consequence. If adhering to these specific columns compromises the readability of a complex routine or data block, take the liberty to break the rule. **Readability and accuracy always come first.** |

---

## 1. Column Alignment

To maintain visual clarity, source files should generally follow these column boundaries:

| Code Element | Target Column | Description |
| :--- | :--- | :--- |
| **Labels** | Column 1 | Standard labels begin at the far left edge. |
| **Opcodes** | Column 13 | Mnemonics and assembler directives (`LD`, `JP`, `DB`, `EQU`). |
| **Operands** | Column 21 | Registers, immediate values, and memory addresses. |
| **Line Comments** | Column 41 | Inline/trailing comments explaining the action. |

---

## 2. Spacing & Formatting Rules

* **Spaces Over Tabs:** Avoid hard tab characters (`\t`) in source files. Alignment is best achieved using standard spaces to ensure consistent rendering across text editors and GitHub.
* **Header Borders:** Comment headers (`;****...` or `;####...`) should ideally span **90 characters** (1 semicolon followed by 89 characters).
* **Comment Margins:** Text within header blocks should generally stay within column 88 to avoid unwanted word wrapping.
* **The `---->` Rule:** When a comment block contains a `---->` marker, place a blank comment line (`;`) between the title line and the explanation text below it.

---

## 3. Data & Sprite Layouts

* **Pattern Headers:** The top line of a data block should state the pattern/sprite name and any original source context.
* **Size Tags:** Place a size tag directly above raw byte blocks (`DB`):
  ```assembly
  ; SIZE: WxH
  ```
  *(Where `W` is width in bytes, and `H` is height in rows).*
* **Omit Redundant Byte Counts:** Avoid adding redundant metadata like total byte counts inside individual sprite comments. Keep data comments focused on function and layout.