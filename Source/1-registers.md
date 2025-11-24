# Registers

## Register Overview

\begin{center}
	\begin{tabular}{|c|c|c|}
		\hline
		\textbf{Index} & \textbf{Register} & \textbf{Description} \\
		\hline
		0x00 & \texttt{pc} & Program Counter \\
		\hline
		0x01 & \texttt{sp} & Stack Pointer \\
		\hline
		0x02 & \texttt{gp} & Global Pointer \\
		\hline
		0x03 & \texttt{fp} & Frame Pointer \\
		\hline
		0x04 & \texttt{ra} & Return Address \\
		\hline
		0x05 & \texttt{rv} & Return Value \\
		\hline
		0x06 & \texttt{ti} & Temporary Immediate \textit{(Used by assembler)} \\
		\hline
		0x07 & \texttt{ta} & Temporary Address \textit{(Used by assembler)} \\
		\hline
		0x08-0x0F & \texttt{r0-r7} & General Purpose Registers \\
		\hline
		0x10-0x17 & \texttt{f0-f7} & General Purpose Floating Point Registers \\
		\hline
	\end{tabular}
\end{center}

## Register Descriptions

### Program Counter
The Program Counter (`pc`) is a 32-bit register that stores the memory address, in bytes, of the next instruction the CPU will run.
The value of the Program Counter is changed by each instruction and is usually incremented by 4, however the _jump_ instructions may set its value to a specific address depending on the outcome of their condition.
The Program Counter should _NEVER_ be manually modified.


### Pointer Registers
The Stack Pointer (`sp`), Global Pointer (`gp`), and Frame Pointer (`fp`), are all registers used explicitly to point to addresses in memory.
The Stack Pointer points to the top of the _stack_ and is modified when pushing or popping values from the stack.
The Global Pointer is used to point to an arbitrary address in memory, but usually for things like global _variables_.
The Frame Pointer is similar to the Stack Pointer but is used specifically to point to the stack frame produced by a _function call_. 

### Return Address
The Return Address register (`ra`) stores the value of the Program Counter that a function should return to after it is finished.
The `CALL` instruction sets `ra := pc + 4`, then jumps to the address of the function being called.
When the function is finished, the `RET` instruction sets `pc := ra`, returning execution to the instruction right after the function call.

### Return Value
The Return Value register (`rv`), is used to store the return value of a function, if necessary.
It is the responsibility of the function to set the value of `rv`.
If the function has no need to return any data, this register can be ignored.

### Temporary Registers
The Temporary Immediate (`ti`), and Temporary Address (`ta`) registers are temporary registers used by the assembler for the processing of _pseudo-instructions_.
They can be used like any other general-purpose register, however that is not recommended as their values cannot be relied upon.

### General Purpose Registers
Registers `r0-r7` are general purpose registers, meaning that they can be used for whatever purpose deemed necessary, meaning that these are the registers that the programmer will use the most.