// Question 4:
// Write an ARM assembly code snippet that initializes a variable power with 1 and calculates the value of 2 to the power of exponent. Store the result in a register. Assume exponent is initialized with 3.

// Answer: 
.data
.text
.global main

main: 
    // Initialize variables
    mov x4, #1          // power (result)
    mov x1, #2          // base 2
    mov x2, #3          // exponent

while: 
    cmp x4, x2
    beq endwhile

    mul x4, x4, x1      // Multiply power by base 2
    sub x2, x2, #1    	// Decrement exponent
    b while 

endwhile: 
    // Final result is in x4
    mov x0, #0 
    ret 
