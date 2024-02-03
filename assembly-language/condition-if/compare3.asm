// Question 3:
// Write an ARM assembly code snippet that checks if x is negative. If true, set y to the absolute value of x; otherwise, set y to x.

// answer: 
.data
.text
.global main

main: 
	ldr x1, =x
	ldr x2, [x1]

	ldr x3, =y
	ldr x4, [x3]
	
	blt x2, #0 
	mov x2, x4
	bmi if

if: 
	str x2, [x3]

endif: 
	mov x0, #0
