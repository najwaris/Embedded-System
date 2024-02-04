// Question 4:
// You are implementing a recursive function that requires saving the values of multiple registers on the stack before making a recursive call. 
// Write ARM assembly code to save the values of registers x1, x2, and x3 onto the stack.

// Answer: 
.data
.text
.global main

recurfunc: 
    stp x1, x2, x3, [sp, #-24]!  // Save registers x1, x2, and x3 onto the stack
    
    // Your recursive function code here
    
    ldp x1, x2, x3, [sp], #24   // Restore registers x1, x2, and x3 from the stack
    ret 

main:
    bl recurfunc
    mov x0, #0 
    ret 
