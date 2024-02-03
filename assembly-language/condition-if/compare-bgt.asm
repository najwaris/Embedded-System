// Question 1:
// Write an ARM assembly code snippet that compares two values, x1 and x2, and if x1 is greater than x2, set x3 to 1; otherwise, set x3 to 0.

// answer:
.data 
.text
.global main 

main: 
	mov x1, #12
	mov x2, #10 
	cmp x1, x2
	
	bgt if
	ble else 

if: 
	mov x3, #1
	b endif

else: 
	mov x3, #0
	b endif

endif: 
	mov x0, #0 
	ret
