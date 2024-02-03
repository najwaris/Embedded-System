// Question 1:
// Write an ARM assembly code snippet that initializes a variable count with 0 and increments it by 2 in each iteration until it reaches 10. Store the final value of count in a memory location.

// Answer: 
.data
.text
.global main

main: 
	// initialize count
	mov x1, #0
	mov x2, #10

while:
	cmp x1, x2
	beq endwhile

	//increment by 2
	add x1, #2
	b while 

endwhile:
	str x1, [x3]
	mov x0, #0
	ret 
