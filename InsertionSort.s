	TTL lap
	AREA program,Code , READWRITE
	ENTRY
	
	LDR r0,=dizi
	mov r1,#1
loop
	cmp r1,#10
	BHI end1
	mov r2,r1
loop2
	cmp r2,#0
	beq end2
	LDR r3,[r0,r2,LSL #2]
	sub r4,r2,#1
	LDR r5,[r0,r4,LSL #2]
	cmp r3,r5
	BHI endf
	mov r6,r3
	STR r5,[r0,r2,LSL #2]
	STR r6,[r0,r4,LSL #2]
endf
	sub r2,r2,#1
	B loop2
end2
	add r1,r1,#1
	B loop
end1

	
dizi DCD 4,2,8,6,5,12,10,16,12,20

end