main:
    mov sp, #256 /* assumes RAM of 64 words */ 
    mov r0, #5 
 
    bl fib_rec 

end_main:
    b end_main 

fib_rec:
	
	sub sp,sp, #4 
	str r4, [sp] 
	sub sp,sp, #4 
	str r5, [sp] 
	sub sp,sp, #4 
	str r6, [sp] 
	sub sp,sp, #4 
	str lr, [sp] 

	cmp r0, #1 
	bgt else 
	movlt r0, #0 // return 0
	moveq r0, #1 // return 1 
	b done // 64

else:
	mov r4, r0 
	sub r0, r0, #1 
	bl fib_rec 
	mov r5, r0 // return value goes in r5 
	sub r0, r4, #2
	bl fib_rec
	mov r2, r0 // retrun value goes in r2
	add r0, r5, r2
	b done

done:
	ldr lr, [sp]
	add sp,sp, #4
	ldr r6, [sp]
	add sp,sp, #4
	ldr r5, [sp]
	add sp,sp, #4
	ldr r4, [sp]
	add sp,sp, #4


	bx lr
