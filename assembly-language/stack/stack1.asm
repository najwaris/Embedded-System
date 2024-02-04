// Question 1:
// You are implementing a function that needs to save the current value of the lr (link register) before making a function call. 
// Write ARM assembly code to save the value of lr onto the stack.

// Answer:
.data
.text
.global main

randomFunc: 
	// Put function code here

main: 
	stp x30, x31, [sp, #-16]!  // Save the link register (lr) onto the stack
	call randomFunc
	ldp x30, x31, [sp], #16   // Restore the link register (lr) from the stack

end: 
	mov x0, #0 
	ret 
