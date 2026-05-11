**A bug is just a misplaced register value, and the stack is the map that tells me how that value got there.**

Every bug is traceable on the stack and/or heap, making assembly language the ultimate debugging tool. This works great with compiled languages like C/C++, Rust and Go; interpreted languages like Python and JS have “bytecode languages” that look like and function the same as assembly (this is because they run on a virtual CPU, meaning it’s essentially a simulation of a computer within a computer). 
Before, the debug process felt unbearable because errors were vaguely described in terminal output (e.g. “NullReference) and required a guessing game of trial-and-error. Every error goes back to asm.


Regardless of the language, the Logic is the same.
* A "Variable" is just a location in memory.
* An "If Statement" is just a comparison and a jump.
* A "Function" is just a jump to a new address with a way to get back.
When you learn to debug at the Assembly level, you are learning the Universal Language of Errors. If the assembly is doing math, look for the math line; If the assembly is calling a function, look for the function call.


**More things to note:**
* Tracing the register’s math is still necessarily in a case where for example, your program runs perfectly but gives the wrong answer (e.g., 2+2=5), the stack might look "healthy."
* If the data on the heap gets corrupted, you use the stack to find the pointer, then you go "look" at that address in memory to see the mess.
* Sometimes, clever compilers (like with Release mode) will stop using the stack for certain things to make the code faster and “optimized”. They might keep everything in registers. In that case, you're "Tracing the Registers" instead of the stack.
* Mapping is connecting an assembly instruction to its high-level code equivalent. This is done via pattern recognition (e.g. conditionals using cmp and jmp) and context clues. 
* Great tools for this: GDB, VS code, ghidra, binary ninja, IDA pro (decompiles the assembly and recreates it and recreates the original C code to match the assembly output; tend to show the language and assembly instructions side-by-side)


## The ultimate clarity:
This is why you don't feel like a "novice" for long once you learn this. You've stopped guessing. A "regular" coder might spend three days changing if statements randomly. A person who knows how to trace the stack/assembly spends thirty minutes finding the exact bit that flipped and fixes it once.


## Examples

The "If-Statement" Pattern
* High Level: if (x == 5) { ... }
* Assembly Pattern: 
1. A cmp (Compare) instruction.
2. A je or jne (Jump) instruction.
3. A block of code that gets skipped if the jump happens.

The "Function Call" Pattern
* High Level: result = calculate(10, 20);
* Assembly Pattern:
1.	mov ecx, 10 (Put first argument in register)
2.	mov edx, 20 (Put second argument in register)
3.	call <address> (Jump to the function)
4.	mov [rbp-0x8], eax (The return value is always in EAX, move it to a local variable)