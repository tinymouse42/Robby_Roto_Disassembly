# TERSE Naming Rules & Conventions

This document details the capitalization, prefix, and label length conventions used to translate historical TERSE engine constructs into clean, `zmac`-compatible Z80 assembly.

Because `zmac` is case-insensitive, these guidelines help maintain visual distinctions between high-level words, low-level words, subroutines, and local routines.

---

## 1. Capitalization & Label Types

* **TERSE High-Level Definitions (`:`) & Code Words:**
  * Prefix with an underscore (`_`) and use **UPPERCASE**.
  * Convert characters that are invalid in Z80 labels to lowercase or spoken words:
    * `_DROP`
    * `B@` $\rightarrow$ `_Bat`
    * `B+` $\rightarrow$ `_Bplus`

* **TERSE Low-Level Code Words:**
  * Use **lowercase** by default.
  * If a low-level word shares a name with a high-level UPPERCASE word, append `_code` (e.g., `snap_code`).

* **TERSE Subroutines (`SUBR`):**
  * Use **all lowercase** by convention (e.g., `read_inputs`, `update_score`).

* **Variables & Equivalents (`EQU`):**
  * Use **ALL UPPERCASE** by convention (e.g., `PLAYER_LIVES`, `BORDER_COLOR`).

* **TERSE Block Headers:**
  * Prefix block numbers with their module name to prevent duplicate labels across master files:
    ```text
    { OS - BLOCK 0150 }
    ```

---

## 2. Label Lengths & Local Jumps

* **Maximum Label Length:** New or renamed labels should ideally be kept to **16 characters or fewer**.
* **Avoid Raw Auto-Labels:** Internal jumps should avoid raw, uninformative auto-generated labels (e.g., `L1024`).
* **Short Jump Naming Pattern:**
  * For loops and short jumps inside a routine, use the first six (or fewer) letters of the main routine's label followed by an incremental number.
  * *Example:* Inside a main routine labeled `PrintString`, name internal jumps `Print1`, `Print2`, etc.