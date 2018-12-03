@CS17BTECH11042
.main:
	movu r0, 0
	mov r1, 0
	mov r2, 0
	mov r3, r0
	mov r4, 0
	mov r8, 0

	.factorian:
		.factloop:
			cmp r0, 0
			beq .end
			mod r5, r0, 10
			add r8, r8, r5
			div r0, r0, 10
			.factorial:
				mov r6, 1
				mov r7, 1
				.loop:
					cmp r7, r5
					bgt .break
					mul r6, r6, r7
					add r7, r7, 1
					b .loop
				.break:
					add r4, r4, r6
			b .factloop
		.end:
			cmp r4, r3
			beq .factresult
			b .dudeney


	.factresult:
		mov r1, 1
		b .dudeney

	.dudeney:
		mul r9, r8, r8
		mul r9, r9, r8
		cmp r9, r3
		beq .duderesult
		b .finalprint

	.duderesult:
		mov r2, 1
		b .finalprint

	.finalprint:
		.print r1, r2
