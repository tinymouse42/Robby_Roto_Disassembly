# Robby Roto — Z80 Source Reconstruction

This repository contains the disassembly, source code reconstruction, and technical documentation for the classic arcade game **Robby Roto** (Bally/Midway, 1981).

---

## 🛠️ Build & Tools

* **Assembler:** zmac v1.3 (Z80 Macro Cross Assembler)
  * [Windows Binary (`zmac.exe`)](https://ballyalley.com/ml/ml_tools/Zmac13_win32.zip)
* **Primary Source:** `src/rr_disassembly.asm`

---

### Building the ROMs ---> Windows 10 / 11

The Windows build script searches for `zmac` in the following order:

1. The executable named by the `ZMAC` environment variable.
2. `tools\zmac.exe` in the repository.
3. `zmac.exe` in `PATH`.

To assemble the source code into MAME-ready ROMs, run the build script from the root directory:

```cmd
build.bat
```

The script will automatically compile the assembly and deposit the final, ready-to-play binaries (`roto1.bin` through `rotox10.bin`) along with the packaged `robby.zip` into a new `roms/` folder in your project root.

To select a specific assembler executable outside the default search locations:

```cmd
set ZMAC=C:\path\to\zmac.exe
build.bat
```

---

## Repository Structure

```text
├── build.bat                  # Primary Windows build script
├── build.sh                   # Primary Linux build script
├── README.md                  # Project documentation
├── roms/                      # Generated ROM binaries
├── src/
│   ├── rr_disassembly.asm     # Main Z80 source disassembly
│   ├── CVGLIB.H.include       # Commercial Video Game Library Include
│   └── zout/                  # Intermediate build files (.hex, .lst)
└── tools/
    └── .gitkeep               # Directory tracking file
```

---

## Coding Standards & Guidelines

To maintain visual and structural consistency across all arcade disassembly repositories, source code edits should follow our shared project standards.

| A Note on Flexibility |
| :--- |
| **These formatting standards are meant for guidance, not to force you into a coding straitjacket.** While a consistent layout is highly encouraged as a best practice, you are free to make exceptions without consequence. If adhering to these specific columns compromises the readability of a complex routine or data block, or you just don't like the look of the code, take the liberty to break the rule. **Readability and accuracy always come first.** |

* **Z80 Coding Style & Layout** - Column alignments, spacing, and comment conventions.
* **TERSE Naming Rules**        - Capitalization, label length, and internal jump conventions.