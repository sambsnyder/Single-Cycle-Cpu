main:
    mov sp, #256 /* assumes RAM of 64 words */
    sub sp, sp, #4
    mov r0, #0
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #3
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #14
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #-2
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #10
    str r0, [sp]    

    mov r0, sp
    mov r1, #5
    bl find_max

end_main:
    b end_main
    
find_max:
	mov r3, #0 // counter
	mov r5, #0 // max
loop:
	cmp r3, r1 
	beq done
	ldr r4, [r0]
	add r0, r0, #4
	cmp r5, r4 // cmp max and array element
	movlt r5, r4
	add r3, r3, #1
	b loop
done:
	mov r0, r5
	bx lr
