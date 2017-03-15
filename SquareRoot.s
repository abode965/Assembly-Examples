	TTL lap
	AREA program,Code , READWRITE
	ENTRY
	mov r0,#225 ; Number
	mov r4,#0 ; int =g1
	LSR r2,r0,#1 ; int squareRoot=number/2
lq				; do{
	mov r4,r2; g1=squareRoot
	BL divideByHalf ;number/g1 --> return r3
	add r2,r4,r3; squareRoot=g1+(number/g1)
	LSR r2,r2,#1 ;squareRoot/=2}
	subs r9,r4,r2 ;while(g-squareRoot!=0);
	beq end5	; 
	b lq		

	
divideByHalf
	mov r1,r0
	mov r3,#0
loop1
	cmp r1,r4
	blo end2
	sub r1,r1,r4
	add r3,r3,#1
	b loop1
end2
	bx lr





end5	
	end