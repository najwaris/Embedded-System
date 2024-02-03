// Question 6:
// Write an ARM assembly code snippet that initializes a variable n with 1 and calculates the sum of the first 10 positive integers using a while loop. Store the result in a register.

// Answer: 
.data
.text
.global main

main: 
	// index set to 1
	mov x0, #1
	// counter set to 10 
	mov x1, #10 
	// initialise sum
	mov x3, #0
	
while:
	cmp x0, x1
	bgt endwhile

	// sum 10 first int 
	add x3, x1, x3

	// increment index 
	add x1, x1, #1 
	b while 

endwhile: 
	mov x0, #0 
	ret 
