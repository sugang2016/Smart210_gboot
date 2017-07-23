/*
@File Name :@start.S
@Author : sugang
@Description : gboot init smart210
*/

.text
.global _start
_start: 
	b	reset
	ldr  pc, _undefined_instruction
	ldr  pc, _software_interrupt
	ldr  pc, _prefetch_abort
	ldr  pc, _data_abort
	ldr  pc, _not_used
	ldr  pc, _irq
	ldr  pc, _fiq

 _undefined_instruction: 	.word undefined_instruction
 _software_interrupt: 	.word software_interrupt
 _prefetch_abort: 		.word prefetch_abort
 _data_abort: 			.word data_abort
 _not_used: 			.word not_used
 _irq: 				.word irq
 _fiq: 				.word fiq

undefined_instruction:
	nop
software_interrupt:
	nop
prefetch_abort:
	nop
data_abort:
	nop
 not_used:
 	nop
irq:
	nop
fiq:
	nop
reset:
	nop






