# Basic Assembly Components

* **Instructions** (tells CPU what to do)  
* **Operands** (which instructions to jump to)  
* **Registers** (basically the RAM for data)

*\*\*Note: Assembly syntax depends on the device you’re programming on (e.g. code for the x84 won’t work for ARM)*

# CPU Registers

These are small, high-speed storage locations within the processor that holds data and instructions temporarily.

* Plays important role in program execution  
* The reason why CPU can access and manipulate data rapidly

## Examples:

* **General-purpose**: holds data for various data types  
* **Special-purpose**: holds the current instruction being executed; keeps track of the address of next instruction (e.g. Instruction register)  
* **Status**: maintain data about the current state of the CPU (e.g. arithmetic flags)

# Assembly Flags

Special bits in the CPU that store results of operations and help control flow of a program.

* Updated automatically based on the outcome of instructions  
* Used to make decisions during execution

## Includes:

* **Zero flag (ZF)**: set when operation results 0  
* **Carry flag (CF)**: for results too large for the register to hold  
* **Overflow flag (OF):** tracks whether an operation results in an overflow  
* **Sign flag (SF):** whether results are negative

\*\*Flags **extremely important** in **conditionals**\!\! After a comparison, a ‘jump’ instruction will check flag status to determine whether or not to jump to another part of the code.

Flags are the key way that the CPU processes tasks and results.

# Memory & Addressing Modes

**Memory** refers to the physical location of data.  
**Addressing modes** define different ways that data can access the memory and determines how the CPU **interprets the addresses** in instructions.

## Examples:

* **Intermediate** (e.g. ADD R1, 5\)  
  * Adds 5 directly to register 1  
* **Direct** (e.g. ADD R1\[1000\])  
  * Memory address for data to be added to R1  
* **Indirect** (e.g. ADD R1\[R2\])  
  * R2 holds the address of value to be added to R1

# Basic Assembly Instructions

* **Arithmetic**: math operations


| ADD R1, R2 | MUL R1, R2 |
| :---- | :---- |
| SUB R1, R2 | DIV R1, R2 |


* **Logic**: bitwise operations


| AND R1, R2 | OR R1, R2 |
| :---- | :---- |
| XOR R1, R2 | NOT R1 |

* **Control:** direct program flow


| JMP LABEL (jump to specific label) | CMP R1, R2 (compares values R1 and R2) |
| :---- | :---- |
| JE LABEL (jump if values are equal) | JNE LABEL (jump if values are NOT equal) |


* **Data movement:** transfers data


| MOV R1, R2 (moves data from R1 to R2) | PUSH R1 (saves R1’s value to stack) |
| :---- | :---- |
| POP R1 (retrieves last value from stack) |  |


* **Bit manipulation**


| SHL R1, 1 (shifts registers bit left) | SHR R1, 1 (shifts registers bit right) |
| :---- | :---- |

  \*\* *SHL **multiplies** the value by 2, SHR **divides** the value by 2*


  

| ROL R1, 1 (rotates left) | ROR R1, 1 (rotates right) |
| :---- | :---- |


  *\*\*Note: There are more instructions, these are just the basic ones.*


  

# How Assembly is Executed

Executed through the process **‘Fetch-Decode-Execute’**.

## Stages:

1. **Fetch** \- CPU retrieves an instruction from memory, typically pointed to by the program counter.  
2. **Decode** \- CPU interprets fetched instruction, determining what action is required. Also identifies involved operands (eg. recognizing that it needs to move data from one address to another)  
3. **Execute** \- CPU carries out operation as specified by instruction

This cycle repeats for every line/instruction in the program; sequential at core.

Writing in Assembly language requires a deep understanding of underlying architecture. This is why learning a low-level language like C can be helpful before diving into Assembly.

Assembly is NOT portable to different CPUs, ill-suited for long-term software development.  
