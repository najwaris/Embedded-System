// Question 2:
// Given an array arr of size 5 (each element is a 32-bit integer), write an ARM assembly code snippet that calculates the sum of all elements in the array using a while loop. Store the result in a register.

// Answer: 
.data
.arr: .word 1, 2, 3, 4, 5   // Example array (replace with your actual values)

.text
.global main

main:
    // Initialize counter and sum
    mov x1, #0          // Counter (index)
    mov x2, #0          // Sum

while:
    // Load the value at the current index
    ldr w3, [x1, .arr]  // x1 holds the index, .arr is the base address

    // Add the value to the sum
    add x2, x2, w3

    // Increment the counter
    add x1, x1, #4      // Move to the next 32-bit word (4 bytes)

    // Check if we've reached the end of the array
    cmp x1, #20         // 5 elements * 4 bytes/element = 20 bytes
    beq endwhile

    b while

endwhile:
    // Store the final sum (optional)
    str x2, [x3]        // Store in memory (replace x3 with the desired address)

    // Exit
    mov x0, #0
    ret
