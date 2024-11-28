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


## Stack Alignment in x86-64 Architecture

### Why Stack Alignment is Necessary

In the **System V AMD64 ABI**, which is used in x86-64 architecture, the **stack must be 16-byte aligned** at the time of function calls. This alignment is required because many modern instructions (such as those dealing with SIMD operations) rely on properly aligned data for correct execution. Misalignment can cause crashes, undefined behavior, or incorrect data manipulation.

### The Problem with Misalignment

When a function like `printf`, which is a **variadic function**, is called, it expects the stack to be properly aligned to 16 bytes. This is particularly important because `printf` can make use of SIMD (Single Instruction, Multiple Data) instructions like `movaps` (aligned move), which require 16-byte aligned memory. If the stack is misaligned, these instructions could fail, leading to crashes.

### Stack Alignment Diagram

+-------------------------------+ <- Stack grows downward (towards lower memory addresses) | Return address of fn (called from main) |
+-------------------------------+ | Previous frame pointer (rbp) |
+-------------------------------+
| Local variables in fn |
+-------------------------------+
| 8 bytes of padding (if needed) | <- Padding to ensure 16-byte stack alignment +-------------------------------+
| Arguments passed to cmp |
+-------------------------------+
### Detailed Explanation:

1. **Function Call (e.g., `main` calls `fn`)**:
    - When `main` calls `fn`, the **return address** is pushed onto the stack, which tells the program where to return after `fn` finishes executing.
    - The `rbp` (frame pointer) is saved onto the stack to create a new stack frame for `fn`.

2. **Stack Misalignment**:
    - If the stack pointer (`rsp`) is misaligned, for example, after pushing the return address, the subsequent function call (e.g., `printf`) may see the stack in an incorrect state.
    - For instance, after a call to `fn`, `rsp` might be aligned to an 8-byte boundary, not a 16-byte one, which would cause issues for `printf`.

3. **Why 16-Byte Alignment Is Critical**:
    - Variadic functions like `printf` are designed to work with a variety of arguments. Inside `printf`, the function relies on the stack to fetch its arguments. 
    - For optimal performance and correct behavior, many internal instructions in functions like `printf` (including SIMD and vectorized instructions) **require** data to be aligned to 16-byte boundaries.
    - If the stack is misaligned by just 8 bytes, instructions like `movaps` (which requires 16-byte alignment) will behave incorrectly, potentially leading to crashes or corrupted data.

4. **Fixing Misalignment**:
    - To avoid this, you need to adjust the stack in the calling function (in this case, `fn`) before calling a function like `printf` or any other function that requires 16-byte alignment.
    - This is done by subtracting 8 bytes from `rsp` (using `sub rsp, 8`), ensuring that the stack is realigned to a 16-byte boundary before the actual function call.

    For example, in your `fn` function:
    ```asm
    sub rsp, 8       ; Align the stack to 16 bytes before calling cmp
    call rax         ; Call the function (cmp)
    add rsp, 8       ; Restore the stack after the call
    ```

### Summary:

- **Stack alignment** ensures that certain instructions and functions (like `printf`) work correctly by providing proper memory alignment, particularly when using SIMD operations.
- Misalignment can lead to undefined behavior, crashes, or incorrect execution of instructions in functions that require aligned data.
- By adjusting the stack alignment in the caller function (using `sub rsp, 8`), you can ensure that functions like `printf` receive the correctly aligned stack and avoid errors caused by misaligned stack data.
