main:
    mov sp, #256 /* assumes RAM of 64 words */
    sub sp, sp, #4
    mov r0, #19
    str r0, [sp]

    bl fib_iter

end_main:
    b end_main

fib_iter:
	sub sp,sp, #4
	str r4, [sp]
	sub sp,sp, #4
	str r5, [sp]

	mov r1, #0 // fib1
	mov r2, #1 // fib2
	mov r3, #2 // i
	 
base:
	cmp r0, #0
	beq done2
	cmp r0, #1
	beq done2
loop:
	cmp r3,r0
	bgt done1
	add r4, r1, r2 
	mov r1, r2
	mov r2, r4
	add r3, r3, #1
	b loop
done1:
	mov r0,r4
done2:
	
	bx lr
