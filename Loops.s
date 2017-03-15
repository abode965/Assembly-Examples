	TTL lap
	AREA program,Code , READWRITE
	ENTRY
	
	LDR r1,=arc
	LDR r2,=brc
	LDR r3,=0x58
	mov r0,#2 ;i=2
	mov r10,#18 ; till=18
Loop
	SUBS r9,r10,r0
	BEQ end1
	mov r4,#0
	add r4,r0,#1
	LDR r5,[R2,R4, LSL #2] ;r5=brc[3]=4
	mov r4,#0
	sub r4,r0,#2
	LDR r6,[R1,r4, LSL #2] 
	mov r7,#0
	add r7,r5,r6
	add r7,r7,r0
	STR r7,[R3,r0,LSL #2]
	add r0,r0,#1
	B Loop
end1
arc DCD 2,4,6,8,10,12,14,16,18,20,21,25,2,1,5,6,7,9,4,2,6,6,8,8
brc DCD 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,8,8,9
 
	end