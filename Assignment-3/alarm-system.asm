// Alarm System Code
// Code starts below:


// Function to blink LED and beep buzzer
blinkAndBeep:
 	mov x9, #0				// Initialise x9 as the counter

	// Loop in function blinkAndBeep
	blinkLoop:
    cmp x9, #5				// Compare 0 and 5 as x9 is 0
    beq endBlinkLoop

    // Turn on the components
    mov x0, x19            	// GPIO chip handle
    mov x1, #21            	// GPIO pin for buzzer
    mov x2, #1             	// Turn on
    bl lgGpioWrite
    mov x1, #17            	// GPIO pin for standard LED
    mov x2, #1             	// Turn on
    bl lgGpioWrite
    mov x0, x19
    mov x1, #19				// GPIO pin for RGB LED: Green
    mov x2, #1				// Turn on
    bl lgGpioWrite
    mov x0, x19
    mov x1, #13				// GPIO pin for RGB LED: Red
    mov x2, #1				// Turn on
    bl lgGpioWrite
    mov x0, x19
    mov x1, #6				// GPIO pin for RGB LED: Blue
    mov x2, #1				// Turn on
    bl lgGpioWrite

    // Delay to turn off the buzzer and RGB LED
    bl delay

    // Turn off the components
    mov x0, x19            	// GPIO chip handle
    mov x1, #21            	// GPIO pin for buzzer
    mov x2, #0             	// Turn off
    bl lgGpioWrite
    mov x0, x19
    mov x1, #17            	// GPIO pin for standard LED
    mov x2, #0             	// Turn off
    bl lgGpioWrite
    mov x0, x19
    mov x1, #19				// GPIO pin for RGB LED: Green
    mov x2, #0				// Turn off
    bl lgGpioWrite
    mov x0, x19
    mov x1, #13				// GPIO pin for RGB LED: Red
    mov x2, #0				// Turn off
    bl lgGpioWrite
    mov x0, x19
    mov x1, #6				// GPIO pin for RGB LED: Blue
    mov x2, #0				// Turn off
    bl lgGpioWrite
    bl delay

    add x9, x9, #1			// Increment the counter
    b blinkLoop

	endBlinkLoop:			// Return to loop in main function
    b loop

// Function for delay
delay:
	// Represents delay for 0.5s
  	ldr x10, =750000000

  	// Loop in function Delay
  	delayLoop:
    nop
    sub x10, x10, #1
    cmp x10, #0
    bne delayLoop
  	ret


.text
.global main
.type main, %function

// Main function
main:
 	// Initialize GPIO
 	mov x0, #0
  	bl lgGpiochipOpen

	// Store the GPIO chip handle
  	mov x19, x0

  	// Claim GPIO pins for Buzzer
  	// lgGpioClaimOutput takes 4 arguments
  	mov x0, x19            // GPIO chip handle
  	mov x1, #0             // No pull-up or pull-down
  	mov x2, #21            // GPIO pin for Buzzer
  	mov x3, #0             // Initial state: 0
  	bl lgGpioClaimOutput

  	// Claim GPIO pins for PIR sensor
  	// lgGpioClaimInput takes 3 arguments
  	mov x0, x19            // GPIO chip handle
  	mov x1, #0             // No pull-up or pull-down
  	mov x2, #16            // GPIO pin for PIR sensor
  	bl lgGpioClaimInput

    // Claim GPIO pins for push button
  	// lgGpioClaimInput takes 3 arguments
  	mov x0, x19            // GPIO chip handle
  	mov x1, #0             // No pull-up or pull-down
  	mov x2, #26            // GPIO pin for Push button
  	bl lgGpioClaimInput

    // Claim GPIO pins for LED (standard LED)
  	// lgGpioClaimInput takes 3 arguments
  	mov x0, x19            // GPIO chip handle
  	mov x1, #0             // No pull-up or pull-down
  	mov x2, #17            // GPIO pin for LED
  	mov x3, #0             // Initial state: 0
  	bl lgGpioClaimOutput

	// Claim GPIO pins for RGB LED: GREEN
  	// lgGpioClaimInput takes 3 arguments
  	mov x0, x19            // GPIO chip handle
  	mov x1, #0             // No pull-up or pull-down
  	mov x2, #19            // GPIO pin for RGB LED: GREEN
  	mov x3, #0             // Initial state: 0
  	bl lgGpioClaimOutput

	// Claim GPIO pins for RGB LED: RED
  	// lgGpioClaimInput takes 3 arguments
  	mov x0, x19            // GPIO chip handle
  	mov x1, #0             // No pull-up or pull-down
  	mov x2, #13            // GPIO pin for RGB LED: RED
  	mov x3, #0             // Initial state: 0
  	bl lgGpioClaimOutput

	// Claim GPIO pins for RGB LED: BLUE
  	// lgGpioClaimInput takes 3 arguments
  	mov x0, x19            	// GPIO chip handle
  	mov x1, #0             	// No pull-up or pull-down
  	mov x2, #6				// GPIO pin for RGB LED: BLUE
  	mov x3, #0             	// Initial state: 0
  	bl lgGpioClaimOutput

	bl loop

  	// Check if GPIO claim successful
  	cbnz x0, end

	// Main loop
	loop:

    	// Read PIR sensor
    	mov x0, x19            // GPIO chip handle
    	mov x1, #16            // GPIO pin for PIR sensor
    	bl lgGpioRead
    	cmp x0, #1
    	beq blinkAndBeep

   		// Read push button
    	mov x0, x19            // GPIO chip handle
    	mov x1, #26            // GPIO pin for push button
    	bl lgGpioRead
    	cmp x0, #1
    	beq blinkAndBeep

    	b loop

// End program
end:
	mov x0, x19
    bl lgGpiochipClose
    mov x8, #93            // Exit system call
	mov x0, #0             // Return status
	svc #0

