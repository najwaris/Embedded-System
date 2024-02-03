// Question 3:
// Write an ARM assembly code snippet that initializes two variables, num with 1 and result with 1. Use a while loop to calculate the factorial of num and store the result in result. Continue the loop until num reaches 5.

// Answer: 
.data
num:    .word 1
result: .word 1

.text
.global main 

main: 
    // Load memory addresses
    ldr x0, =num
    ldr x1, =result

while:
    // Load value of num
    ldr w2, [x0]

    // Multiply result by num
    mul w1, w1, w2

    // Increment num
    add w2, w2, 1
    str w2, [x0]

    // Check if num has reached 5
    cmp w2, 5
    ble while          // Continue if num <= 5 (not bleq)

endwhile: 
    // Exit
    mov x0, #0
    ret
