// Question 3:
// Write ARM assembly code to implement a function that calculates the sum of an array of 10 integers. 
// The address of the array is passed as a parameter, and the result should be stored in register x0.

// Answer:
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
.text
.global main

main:
    ldr x0, =array
    mov x1, #0
    mov x3, #10

loop:
    ldr w2, [x0]
    add x1, x1, w2       // to add the sum of the element in the array 
    add x0, x0, #4      // to increment the index of the array 
    subs x3, x3, #1      // to decrement the counter
    bne loop

end:
    mov x0, x1
    ret

