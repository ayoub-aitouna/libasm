# General Purpose Registers in x86-64 Architecture

| Register | 64-bit | 32-bit | 16-bit | 8-bit High | 8-bit Low | Usage                                                                 |
|----------|--------|--------|--------|------------|-----------|-----------------------------------------------------------------------|
| **RAX**  | RAX    | EAX    | AX     | AH         | AL        | General purpose, accumulator for arithmetic operations.              |
| **RBX**  | RBX    | EBX    | BX     | BH         | BL        | General purpose, sometimes used as a base pointer in some operations.|
| **RCX**  | RCX    | ECX    | CX     | CH         | CL        | Loop counter for instructions like `REP` and `LOOP`.                 |
| **RDX**  | RDX    | EDX    | DX     | DH         | DL        | General purpose, used in division and I/O operations.                |
| **RSI**  | RSI    | ESI    | SI     | -          | SIL       | Source index for string operations (e.g., `MOVSB`, `LODSB`).         |
| **RDI**  | RDI    | EDI    | DI     | -          | DIL       | Destination index for string operations.                             |
| **RBP**  | RBP    | EBP    | BP     | -          | BPL       | Base pointer for stack frames in function calls.                     |
| **RSP**  | RSP    | ESP    | SP     | -          | SPL       | Stack pointer for top of the stack.                                  |
| **R8**   | R8     | R8D    | R8W    | -          | R8B       | Additional general-purpose register introduced in x86-64.            |
| **R9**   | R9     | R9D    | R9W    | -          | R9B       | Additional general-purpose register introduced in x86-64.            |
| **R10**  | R10    | R10D   | R10W   | -          | R10B      | Additional general-purpose register introduced in x86-64.            |
| **R11**  | R11    | R11D   | R11W   | -          | R11B      | Additional general-purpose register introduced in x86-64.            |
| **R12**  | R12    | R12D   | R12W   | -          | R12B      | Additional general-purpose register introduced in x86-64.            |
| **R13**  | R13    | R13D   | R13W   | -          | R13B      | Additional general-purpose register introduced in x86-64.            |
| **R14**  | R14    | R14D   | R14W   | -          | R14B      | Additional general-purpose register introduced in x86-64.            |
| **R15**  | R15    | R15D   | R15W   | -          | R15B      | Additional general-purpose register introduced in x86-64.            |
| **RIP**  | RIP    | -      | -      | -          | -         | Instruction pointer, holds the address of the next instruction.      |


# x86-64 System V ABI Function Parameter Register Mapping

| Parameter | Register |
|-----------|----------|
| 1st       | RDI      |
| 2nd       | RSI      |
| 3rd       | RDX      |
| 4th       | RCX      |
| 5th       | R8       |
| 6th       | R9       |
