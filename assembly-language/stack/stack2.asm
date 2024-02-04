// Question 2:
// You have three variables, a, b, and c. Write ARM assembly code to swap the values of a and c using the stack.

// Answer:
.data
.text
.global main

a: .quad 10
b: .quad 20
c: .quad 30

main:
    ldr x0, =a
    ldr x1, =b
    ldr x2, =c

    mov x3, [x0]
    mov x4, [x1]
    mov x5, [x2]

    stp x3, x5, [sp, #-16]!  // Store a and c on the stack
    ldp x5, x3, [sp], #16   // Load c into x3 and a into x5

    str x5, [x0]           // Store swapped a back into memory
    str x3, [x2]           // Store swapped c back into memory

end:
    mov x0, #0
    ret
