;******************************************************************************************
;   ______ ____    ____  _______  __       __  .______       __    __
;  /      |\   \  /   / /  _____||  |     |  | |   _  \     |  |  |  |
; |  ,----' \   \/   / |  |  __  |  |     |  | |  |_)  |    |  |__|  |
; |  |       \      /  |  | |_ | |  |     |  | |   _  <     |   __   |
; |  `----.   \    /   |  |__| | |  `----.|  | |  |_)  |  __|  |  |  |
;  \______|    \__/     \______| |_______||__| |______/  (__)__|  |__|
;
;
;  Bally Commercial Video Game Library Header (CVGLIB.H)
;  Target: Robby Roto (Includes custom I/O ports)
;
;******************************************************************************************
; Derived from Nutting Manual and reformatted using mixed case.
; Retyped and proofread by Adam Trionfo, Lance F. Squire, and Richard C. Degler.
;
; REVISION HISTORY:
;   v1.00  [2002-01-17]  Initial release (as ballyequ.h)
;                        By: Adam Trionfo & Lance F. Squire
;   v2.52  [2003-03-28]  Converted to HVGLIB.H
;                        By: Adam Trionfo & Lance F. Squire
;   v2.60  [2004-03-02]  BallyAlley.com public release
;                        By: Adam Trionfo & Lance F. Squire
;   v3.00  [2009-01-01]  Updated "Font Base Character" comment handling
;                        By: Richard C. Degler
;   v3.01  [2010-12-29]  Rebuilt from scratch
;                        By: Richard C. Degler
;   v3.02  [2018-12-05]  Converted from HVGLIB.H with Robby Roto specific I/O ports
;                        By: Richard C. Degler
;
;******************************************************************************************

;==========================================================================================
; Commercial Video Game Equates
;==========================================================================================

;------------------------------------------------------------------------------------------
; ASSEMBLY CONTROL
;------------------------------------------------------------------------------------------
XPNDON  EQU     1                 ; Set to 1 for hardware expansion
NWHDWR  EQU     1                 ; Set to 1 for new hardware

;------------------------------------------------------------------------------------------
; General Goodies (HEX and Decimal values):
;------------------------------------------------------------------------------------------
SCREEN  EQU     $0000             ; 0 for magic SCREEN start
BYTEPL  EQU     $50               ; 80 for BYTEs Per Line in HiRes
; BITSPL EQU    $0140             ; 320 for PIXelS (not BITS) Per Line (no longer byte-sized)
NORMEM  EQU     $4000             ; 16384 for size of NORmal MEMory and Start address

;------------------------------------------------------------------------------------------
; BITS in PROCESSOR FLAG byte:
;------------------------------------------------------------------------------------------
PSWCY   EQU     0                 ; Processor Status Word, CarrY bit
PSWPV   EQU     2                 ; Processor Status Word, Parity or oVerflow bit
PSWZRO  EQU     6                 ; Processor Status Word, ZeRO bit
PSWSGN  EQU     7                 ; Processor Status Word, SiGN bit

;------------------------------------------------------------------------------------------
; Standard VECTOR DISPLACEMENTS and bits:
;------------------------------------------------------------------------------------------
VBMR    EQU     $00               ; +0  ; Vector Block, Magic Register
VBSTAT  EQU     $01               ; +1  ; Vector Block, STATus byte
VBTIMB  EQU     $02               ; +2  ; Vector Block, TIMe Base
VBDXL   EQU     $03               ; +3  ; Vector Block, Delta for X Low
VBDXH   EQU     $04               ; +4  ; Vector Block, Delta for X Hi
VBXL    EQU     $05               ; +5  ; Vector Block, X coord Low
VBXH    EQU     $06               ; +6  ; Vector Block, X coord Hi
VBXCHK  EQU     $07               ; +7  ; Vector Block, X CHecK flags
VBDYL   EQU     $08               ; +8  ; Vector Block, Delta for Y Low
VBDYH   EQU     $09               ; +9  ; Vector Block, Delta for Y Hi
VBYL    EQU     $0A               ; +10 ; Vector Block, Y coord Low
VBYH    EQU     $0B               ; +11 ; Vector Block, Y coord Hi
VBYCHK  EQU     $0C               ; +12 ; Vector Block, Y CHecK flags
VBOAL   EQU     $0D               ; +13 ; Vector Block, Old Address Low
VBOAH   EQU     $0E               ; +14 ; Vector Block, Old Address Hi

;------------------------------------------------------------------------------------------
; DISPLACEMENTS from start of COORDINATE AREA (X or Y):
;------------------------------------------------------------------------------------------
VBDCL   EQU     $00               ; +0  ; Vector Block, Delta for Coord Low
VBDCH   EQU     $01               ; +1  ; Vector Block, Delta for Coord Hi
VBCL    EQU     $02               ; +2  ; Vector Block, Coord Low
VBCH    EQU     $03               ; +3  ; Vector Block, Coord Hi
VBCCHK  EQU     $04               ; +4  ; Vector Block, Coord CHecK flags

;------------------------------------------------------------------------------------------
; BITS in STATUS byte:
;------------------------------------------------------------------------------------------
VBBLNK  EQU     6                 ; Vector Block status, BLaNK bit
VBSACT  EQU     7                 ; Vector Block Status, ACTive bit

;------------------------------------------------------------------------------------------
; BITS in (X or Y) VB CHECK FLAG bit mask:
;------------------------------------------------------------------------------------------
VBCLMT  EQU     0                 ; Vector Block Check, LiMiT bit
VBCREV  EQU     1                 ; Vector Block Check, REVerse delta on limit attain
VBCLAT  EQU     3                 ; Vector Block Check, coordinate Limit ATtained

;------------------------------------------------------------------------------------------
; FONT TABLE DISPLACEMENTS for CHARACTER DESCRIPTOR BLOCK:
;------------------------------------------------------------------------------------------
FTBASE  EQU     $00               ; +0  ; FonT BASE character (normally $20+$80 ALT)
FTFSX   EQU     $01               ; +1  ; FonT Frame X Size width
FTFSY   EQU     $02               ; +2  ; FonT Frame Y Size height
FTBYTE  EQU     $03               ; +3  ; FonT X size for char in BYTEs
FTYSIZ  EQU     $04               ; +4  ; FonT Y SIZe height in rows
FTPTL   EQU     $05               ; +5  ; FonT Pattern Table address Low
FTPTH   EQU     $06               ; +6  ; FonT Pattern Table address Hi

;------------------------------------------------------------------------------------------
; BITS for MAGIC REGISTER (write option) byte:
;------------------------------------------------------------------------------------------
MRSHFT  EQU     $03               ; Magic Register, mask of SHiFT amount 0-3
MRROT   EQU     2                 ; Magic Register, write with ROTate bit
MRXPND  EQU     3                 ; Magic Register, write with eXPaND bit
MROR    EQU     4                 ; Magic Register, write with OR bit
MRXOR   EQU     5                 ; Magic Register, write with eXclusive-OR bit
MRFLOP  EQU     6                 ; Magic Register, write with FLOP bit
MRFLIP  EQU     7                 ; Magic Register, write with FLIP bit

;------------------------------------------------------------------------------------------
; Robby Roto INPUT Port Equates
;------------------------------------------------------------------------------------------
;
;------------------------------------------------------------------------------------------
; INTERRUPT and INTERCEPT INPUT Ports:
;------------------------------------------------------------------------------------------
INTST   EQU     $08               ; =&(8) for INTercept STatus
VERAF   EQU     $0E               ; =&(14) for VERtical Address Feedback
HORAF   EQU     $0F               ; =&(15) for HORizontal Address Feedback

;------------------------------------------------------------------------------------------
; Robby Roto CONTROL INPUT Port:
;------------------------------------------------------------------------------------------
SW0     EQU     $10               ; =&(16) for SWitch bank 0 for Game controls
; BITs of CONTROL Input port (all ACTIVE_LOWs) :
COIN1   EQU     0                 ; $01 or 1 = Coin counter #1
COIN2   EQU     1                 ; $02 or 2 = Coin counter #2
COIN3   EQU     2                 ; $04 or 4 = Coin counter #3 (not supported or read)
SERVICE EQU     3                 ; $08 or 8 = Service mode
TILT    EQU     4                 ; $10 or 16 = Tilt
START1  EQU     5                 ; $20 or 32 = Start #1
START2  EQU     6                 ; $40 or 64 = Start #2
UNUSED  EQU     7                 ; $80 or 128 = nothing (not used)

;------------------------------------------------------------------------------------------
; Second Player 2 (COCKTAIL only) JOYSTICK INPUT Port:
;------------------------------------------------------------------------------------------
SW1     EQU     $11               ; =&(17) for SWitch bank 1 for player 2 4WAY controls
; BITs of JOYSTICK TWO Input port (also ACTIVE_LOWs ??) :
P2UP    EQU     0                 ; $01 or 1 = joystick 2 UP
P2DOWN  EQU     1                 ; $02 or 2 = joystick 2 DOWN
P2LEFT  EQU     2                 ; $04 or 4 = joystick 2 LEFT
P2RIGH  EQU     3                 ; $08 or 8 = joystick 2 RIGHt (bit 4 not used)
P2BUTT  EQU     5                 ; $20 or 32 = BUTTon 2 (bits 6 and 7 not used)

;------------------------------------------------------------------------------------------
; Player 1 (UPRIGHT and COCKTAIL) JOYSTICK INPUT Port:
;------------------------------------------------------------------------------------------
SW2     EQU     $12               ; =&(18) for SWitch bank 2 for player 1 4WAY control
;
; BITs of JOYSTICK ONE Input port (ACTIVE_LOWs ??)
;
P1UP    EQU     0                 ; $01 or 1 = joystick 1 UP
P1DOWN  EQU     1                 ; $02 or 2 = joystick 1 DOWN
P1LEFT  EQU     2                 ; $04 or 4 = joystick 1 LEFT
P1RIGH  EQU     3                 ; $08 or 8 = joystick 1 RIGHt (bit 4 not used)
P1BUTT  EQU     5                 ; $20 or 32 = BUTTon 1 (bits 6 and 7 not used)

;------------------------------------------------------------------------------------------
; Option DIP Switch (ONLY read once, during Power-up):
;------------------------------------------------------------------------------------------
SW3     EQU     $13               ; =&(19) for SWitch bank 3 for Service options
;
; BITS of OPTION Input port (all set INactive_LOW for normal usage ??) :
;
NVRAM   EQU     0                 ; $01 or 1 = Keep NVRAM (0 = Yes, 1 = FULL RESET)
USESM   EQU     1                 ; $02 or 2 = Use Service Mode switch (0 = Yes, 1 = Reset)
FREEP   EQU     2                 ; $04 or 4 = Free Play (0 = Off, 1 = On ??)
CABIN   EQU     3                 ; $08 or 8 = Cabinet (0 = Upright, 1 = Cocktail)
;
; bits 3 through 7 were Listed as "Unused", not just 4 through 6 ??
;
DEMOS   EQU     7                 ; $80 or 128 = Demo_Sounds (0 = Off, 1 = On)
; SW4   EQU     $14               ; =&(20) not used

;------------------------------------------------------------------------------------------
; "SPECIAL" INPUT Port (Writes Incandescent Lamps):
;------------------------------------------------------------------------------------------
SW5     EQU     $15               ; =&(21) for SWitch bank 5 for Special controls
;
; Note: These are data writes, done by IN commands as IN x,(C) with C = 21
; The data (in B) is placed on the upper bits 8-11 bits of the address bus
; and is used to drive 1 of 8 bit addressable latches to control:
; UINT8 data = (offset >> 8) & 1; (has no HIGHLIGHT since it's NOT in HVGLIB.H)
;
; switch ((offset >> 9) & 7) {
;     case 0: coin_counter_w(machine(), 0, data); break;
;     case 1: coin_counter_w(machine(), 1, data); break;
;     case 2: coin_counter_w(machine(), 2, data); break;
;     case 6: set_led_status(machine(), 0, data); break;
;     case 7: set_led_status(machine(), 1, data); break;
; } return 0xff;

;==========================================================================================
; Robby Roto specific OUTPUT Ports
;==========================================================================================

;------------------------------------------------------------------------------------------
; OUTPUT Ports for VIRTUAL COLOR:
;------------------------------------------------------------------------------------------
COL0R   EQU     $00               ; &(0) = COLor 0 Right
COL1R   EQU     $01               ; &(1) = COLor 1 Right
COL2R   EQU     $02               ; &(2) = COLor 2 Right
COL3R   EQU     $03               ; &(3) = COLor 3 Right
COL0L   EQU     $04               ; &(4) = COLor 0 Left
COL1L   EQU     $05               ; &(5) = COLor 1 Left
COL2L   EQU     $06               ; &(6) = COLor 2 Left
COL3L   EQU     $07               ; &(7) = COLor 3 Left
HORCB   EQU     $09               ; &(9) = HORizontal Color Boundary (and Border Color !!)
VERBL   EQU     $0A               ; &(10) = VERtical Blanking Line
COLBX   EQU     $0B               ; &(11) = COLor BloCK multi-port

;------------------------------------------------------------------------------------------
; OUTPUT Ports for MUSIC and SOUNDS:
;------------------------------------------------------------------------------------------
TONMO   EQU     $10               ; &(16) = TONe Master Oscillator
TONEA   EQU     $11               ; &(17) = TONe A oscillator
TONEB   EQU     $12               ; &(18) = TONe B oscillator
TONEC   EQU     $13               ; &(19) = TONe C oscillator
VIBRA   EQU     $14               ; &(20) = VIBRAto frequency & range
VOLC    EQU     $15               ; &(21) = VOLume of tone C (and bits 4 to 7 redefined as ??)
VOLAB   EQU     $16               ; &(22) = VOLumes of tones A & B
VOLN    EQU     $17               ; &(23) = VOLume of Noise
SNDBX   EQU     $18               ; &(24) = SouND BloCK multi-port

;------------------------------------------------------------------------------------------
; INTERRUPT and CONTROL OUTPUT Ports:
;------------------------------------------------------------------------------------------
CONCM   EQU     $08               ; &(8) = 0 for CONsumer, 1 for CoMmercial mode
MAGIC   EQU     $0C               ; &(12) = MAGIC register (with FLIP and FLOP in software !!)
INFBK   EQU     $0D               ; &(13) = INterrupt FeedBacK
INMOD   EQU     $0E               ; &(14) = INterrupt MODe
INLIN   EQU     $0F               ; &(15) = INterrupt LINe
XPAND   EQU     $19               ; &(25) = eXPANDer pixel definition port

;------------------------------------------------------------------------------------------
; BITMASKs for MAGIC REGISTER (write option) byte:
;------------------------------------------------------------------------------------------
MRSHFT  EQU     $03               ; mask of SHiFT amount 0-3
MRROT   EQU     2                 ; $04 or 4 = write with ROTate bit
MRXPND  EQU     3                 ; $08 or 8 = write with eXPaND bit
MROR    EQU     4                 ; $10 or 16 = write with OR bit
MRXOR   EQU     5                 ; $20 or 32 = write with eXclusive-OR bit
MRFLOP  EQU     6                 ; $40 or 64 = write with FLOP bit (used by CMFLOP)
MRFLIP  EQU     7                 ; $80 or 128 = write with FLIP bit (used by CMFLIP)
UNLOCK  EQU     $5B               ; write $A5 FIXME to unlock Write to $E000 - E3FF NV memory

;------------------------------------------------------------------------------------------
; PATTERN Board ports (DMA Transfer Board $78 - $7E):
;------------------------------------------------------------------------------------------
SRCLO   EQU     $78               ; Least significant byte of Source address
SRCHI   EQU     $79               ; MSB of Source address
CMODE   EQU     $7A               ; Copy MODE (aka Line offset value ??)
;
; BITs of COPY Mode (for Pattern Board) port
;
CMDIR   EQU     0                 ; $01 or 1 = Direction bit ?? (0 = ??, 1 = ??) ??
CMXPND  EQU     1                 ; $02 or 2 = Expand mode bit (0 = ??, 1 = ??) to ??
CMCONST EQU     2                 ; $04 or 4 = Constant bit ?? (0 = ??, 1 = ??) ?? ??
CMFLUSH EQU     3                 ; $08 or 8 = Flush bit (0 = ??, 1 = ??) flush what ??
CMFLIP  EQU     4                 ; $10 or 16 = Flip bit (0 = Off, 1 = On) Vertically ??
CMFLOP  EQU     5                 ; $20 or 32 = Flop bit (entire row ??) Horizontally ??
; (bits 6 and 7 unused)
;
SKIPLO  EQU     $7B               ; LSB of Destination OR number of bytes to skip after each row.
DESTHI  EQU     $7C               ; Most significant byte of Destination address
;
LENGTH  EQU     $7D               ; Width (in bytes) of each row to copy
LOOPS   EQU     $7E               ; Height in rows to copy minus one. Writing this initiates transfer.
;
; OUTPUT_PORTS_END

;------------------------------------------------------------------------------------------
; SYSTEM RAM MEMORY Cells:
;------------------------------------------------------------------------------------------
URINAL  EQU     $0FFF             ; STUPID MEMORY CELL
WASTE   EQU     URINAL
WASTER  EQU     WASTE             ; ** LOU HARPS CLEAN AND WHOLESOME TAG **
SYSRAM  EQU     $4FCE             ; Resides at the highest possible address
BEGRAM  EQU     SYSRAM            ; typically used for initial Stack Pointer
CRAPPER EQU     $4FFF             ; URINAL flushes here!

