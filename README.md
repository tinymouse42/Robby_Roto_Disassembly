# Robby Roto — Z80 Source Reconstruction

This repository contains the disassembly, source code reconstruction, and technical documentation for the classic arcade game **Robby Roto** (Bally/Midway, 1981).

The goal of this project is to produce an accurate, buildable Z80 assembly codebase for preservation, study, and reverse engineering, preserving historical TERSE context while adhering to modern readability standards.

---

## 🛠️ Build & Tools

* **Assembler:** `zmac` (Z80 Macro Cross Assembler)
  * **[zmac v1.3](https://ballyalley.com/ml/ml_tools/Zmac13_win32.zip) — Preferred**
  * [zmac v18oct2022](http://48k.ca/zmac.html)
* **Target Hardware:** Midway / Bally Astrocade Hardware
* **Primary Source:** `src/RR_Disassembly.asm`

### Building the ROMs
To assemble the source code into binary ROMs, run:
```bash
**Coming Soon**
```

---

## 📁 Repository Structure

```text
├── src/                    # Z80 Assembly source files
│   └── rr_Disassembly.asm
├── tools/                  # Build scripts, helpers, and sync utilities
├── Docs/                   # Technical references & Info on the specific game
│   ├── Z80_Coding_Style.md
│   └── TERSE_Naming_Rules.md  
└── README.md               # Game-specific overview (this file)
```

---

## 📖 Coding Standards & Guidelines

To maintain visual and structural consistency across all arcade disassembly repositories, source code edits should follow our shared project standards.

| 🚨 A Note on Flexibility |
| :--- |
| **These formatting standards are meant for guidance, not to force you into a coding straitjacket.** While a consistent layout is highly encouraged as a best practice, you are free to make exceptions without consequence. If adhering to these specific columns compromises the readability of a complex routine or data block, or you just don't like the look of the code,  take the liberty to break the rule. **Readability and accuracy always come first.** |


* **Z80 Coding Style & Layout** — Column alignments, spacing, and comment conventions.
* **TERSE Naming Rules**        — Capitalization, label length, and internal jump conventions.