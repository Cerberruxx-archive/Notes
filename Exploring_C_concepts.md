## Look at the C memory model-the real heart of the language

You can understand 80% of C by understanding:

* stack vs heap

* how arrays decay into pointers

* how structs map to contiguous memory

* how alignment works

* how the ABI defines calling conventions

These concepts are hardware-adjacent rather than syntax-heavy. This is where C becomes a window into:

* CPU architecture

* memory layout

* calling conventions

* binary formats

You'll start to see why C is the "portable assembly".


## Explore how C interacts with the OS:

Look into:

* system calls

* file descriptors

* memory allocation

* process creation

* how libc wraps OS features


## Learn C by reading disassembly of simple programs:

Compile it, disassemble it, and check out:

* how arguments are passed

* how registors are used

* how the return value is stored

* how the stack frame is built


## And finally, look at what the compiler does instead of what the language looks like:

* what is assembly language

* how C turns into assembly

* how variables become memory locations

* how functions become stack frames

* how pointers become raw addresses