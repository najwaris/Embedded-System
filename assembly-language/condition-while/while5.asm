// Question 5:
// Given an array numbers of size 8 (each element is a 64-bit integer), write an ARM assembly code snippet that finds the maximum value in the array using a while loop. Store the result in a register.

// Answer: 
.data 
.arr: .word 1, 2, 3, 4, 5, 6, 7, 8
.text
.global main 

main:
	// Initialize counter and sum
    	mov x1, #0          // Counter (index)
    	ldr w2, [x1, .arr]  // first element 

while:
    	// Load the value at the current index
    	ldr w3, [x1, .arr]  // x1 holds the index, .arr is the base address
	cmp w2, w3
	bgt if

	// increment index
	add x1, x1, #4

	// compare the size of array (4 times 8 = 32)
	cmp x1, #32
	bne while
	beq end

if:
	mov w2, w3
	b while 

end: 

	mov x0, #0 
	ret 
	
