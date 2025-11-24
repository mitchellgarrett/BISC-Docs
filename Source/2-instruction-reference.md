# Instruction Reference

\begin{center}
	\begin{tabular}{|c|c|c|c|}
		\hline
		\textbf{Opcode} & \textbf{Mnemonic} & \textbf{Instruction} & \textbf{Action}\\
		\hline
		0x00 & \hyperref[sec:HLT]{\texttt{HLT}} & Halt & Halt CPU execution\\
		\hline
		0x01 & \hyperref[sec:NOP]{\texttt{NOP}} & No Operation & pc := pc + 4\\
		\hline
		0x02 & \hyperref[sec:SYS]{\texttt{SYS}} & System Call & Execute system call\\
		\hline
		0x03 & \hyperref[sec:CALL]{\texttt{CALL}} & Function Call & ra := pc, pc = rs\\
		\hline
		0x04 & \hyperref[sec:RET]{\texttt{RET}} & Return & pc := ra\\
		\hline
		\hline
		0x05 & \hyperref[sec:LLI]{\texttt{LLI}} & Load Lower Immediate & rd[0..15] := imm16\\
		\hline
		0x06 & \hyperref[sec:LUI]{\texttt{LUI}} & Load Upper Immediate & rd[16..31] := imm16\\
		\hline
		0x07 & \hyperref[sec:MOV]{\texttt{MOV}} & Move & rd := rs\\
		\hline
		\hline
		0x08 & \hyperref[sec:LDW]{\texttt{LDW}} & Load Word & mem[rd + offset] = rs\\
		\hline
		0x09 & \hyperref[sec:LDH]{\texttt{LDH}} & Load Half Word & mem[rd + offset] = rs[0..15]\\
		\hline
		0x0A & \hyperref[sec:LDB]{\texttt{LDB}} & Load Byte & mem[rd + offset] = rs[0..7]\\
		\hline
		0x0B & \hyperref[sec:STW]{\texttt{STW}} & Store Word & rd := mem[rs + offset]\\
		\hline
		0x0C & \hyperref[sec:STH]{\texttt{STH}} & Store Half Word & rd[0..15] := mem[rs + offset]\\
		\hline
		0x0D & \hyperref[sec:STB]{\texttt{STB}} & Store Byte & rd[0..7] := mem[rs + offset]\\
		\hline
		\hline
		0x0E & \hyperref[sec:ADD]{\texttt{ADD}} & Add & rd := rs\textsubscript{0} $+$ rs\textsubscript{1}\\
		\hline
		0x0F & \hyperref[sec:SUB]{\texttt{SUB}} & Subtract & rd := rs\textsubscript{0} $-$ rs\textsubscript{1}\\
		\hline
		0x10 & \hyperref[sec:MUL]{\texttt{MUL}} & Multiply & rd := rs\textsubscript{0} $\cdot$ rs\textsubscript{1}\\
		\hline
		0x11 & \hyperref[sec:MULH]{\texttt{MULH}} & Multiply High & rd := rs\textsubscript{0}[16..31] $\cdot$ rs\textsubscript{1}[16..31]\\
		\hline
		0x12 & \hyperref[sec:MULHU]{\texttt{MULHU}} & Multiply High Unsigned & rd := rs\textsubscript{0}[16..31] $+$ rs\textsubscript{1}[16..31]\\
		\hline
		0x13 & \hyperref[sec:DIV]{\texttt{DIV}} & Divide & rd := rs\textsubscript{0} $\div$ rs\textsubscript{1}\\
		\hline
		0x14 & \hyperref[sec:DIVU]{\texttt{DIVU}} & Divide Unsigned & rd := rs\textsubscript{0} $\div$ rs\textsubscript{1}\\
		\hline
		0x15 & \hyperref[sec:MOD]{\texttt{MOD}} & Modulo & rd := rs\textsubscript{0} \% rs\textsubscript{1}\\
		\hline
		0x16 & \hyperref[sec:MODU]{\texttt{MODU}} & Modulo Unsigned & rd := rs\textsubscript{0} \% rs\textsubscript{1}\\
		\hline
		\hline
		0x17 & \hyperref[sec:NOT]{\texttt{NOT}} & Logical Not & if rs = 0, rd := 1, else rd := 0\\
		\hline
		0x18 & \hyperref[sec:NEG]{\texttt{NEG}} & Integer Negate & rd := -1 $\cdot$ rs\\
		\hline
		0x19 & \hyperref[sec:INV]{\texttt{INV}} & Bitwise Invert & rd := rs $\oplus$ 0xffffffff\\
		\hline
		\hline
		0x1A & \hyperref[sec:AND]{\texttt{AND}} & Bitwise And & rd := rs\textsubscript{0} $\land$ rs\textsubscript{1}\\
		\hline
		0x1B & \hyperref[sec:OR]{\texttt{OR}} & Bitwise Or & rd := rs\textsubscript{0} $\lor$ rs\textsubscript{1}\\
		\hline
		0x1C & \hyperref[sec:XOR]{\texttt{XOR}} & Bitwise Exclusive Or & rd := rs\textsubscript{0} $\oplus$ rs\textsubscript{1}\\
		\hline
		0x1D & \hyperref[sec:BSL]{\texttt{BSL}} & Bit Shift Left & rd := rs\textsubscript{0} << rs\textsubscript{1}\\
		\hline
		0x1E & \hyperref[sec:BSR]{\texttt{BSR}} & Bit Shift Right & rd := rs\textsubscript{0} >> rs\textsubscript{1}\\
		\hline
		\hline
		0x1F & \hyperref[sec:JMP]{\texttt{JMP}} & Jump & pc := rd\\
		\hline
		0x20 & \hyperref[sec:JEZ]{\texttt{JEZ}} & Jump If Zero & if rs = 0, pc := rd\\
		\hline
		0x21 & \hyperref[sec:JNZ]{\texttt{JNZ}} & Jump If Not Zero & if rs != 0, pc := rd\\
		\hline
		0x22 & \hyperref[sec:JEQ]{\texttt{JEQ}} & Jump If Equal & if rs\textsubscript{0} = rs\textsubscript{1}, pc := rd\\
		\hline
		0x23 & \hyperref[sec:JNE]{\texttt{JNE}} & Jump If Not Equal & if rs\textsubscript{0} $\neq$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x24 & \hyperref[sec:JGT]{\texttt{JGT}} & Jump If Greater Than & if rs\textsubscript{0} $>$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x25 & \hyperref[sec:JLT]{\texttt{JLT}} & Jump If Less Than & if rs\textsubscript{0} $<$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x26 & \hyperref[sec:JGE]{\texttt{JGE}} & Jump If Greater Or Equal & if rs\textsubscript{0} $\geq$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x27 & \hyperref[sec:JLE]{\texttt{JLE}} & Jump If Greater Or Less & if rs\textsubscript{0} $\leq$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x28 & \hyperref[sec:JGTU]{\texttt{JGTU}} & Jump If Greater Than Unsigned & if rs\textsubscript{0} $\geq$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x29 & \hyperref[sec:JLTU]{\texttt{JLTU}} & Jump If Less Than Unsigned & if rs\textsubscript{0} $\leq$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x2A & \hyperref[sec:JGEU]{\texttt{JGEU}} & Jump If Greater Or Equal Unsigned & if rs\textsubscript{0} $\geq$ rs\textsubscript{1}, pc := rd\\
		\hline
		0x2B & \hyperref[sec:JLEU]{\texttt{JLEU}} & Jump If Less Or Equal Unsigned & if rs\textsubscript{0} $\leq$ rs\textsubscript{1}, pc := rd\\
		\hline
	\end{tabular}
\end{center}