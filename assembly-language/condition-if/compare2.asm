//Question 2:
//Given two variables, a and b, implement an ARM assembly code snippet that checks if a is not equal to b. If true, set result to 1; otherwise, set result to 0.

//answer: 
.data 
.text
.global main 

main: 
  ldr x1, =a
	ldr x2, =b
	ldr x3, [x1]
	ldr x4, [x2]

	cmp x3, x4
	bne if

	mov x0, #0	//result

if: 
	mov x0, #1	//result

endif: 
	
	mov x0, #0
	ret
