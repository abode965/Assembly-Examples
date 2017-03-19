	TTL lap
	AREA program,Code , READWRITE
	ENTRY
	
	LDR r0,=dizi
	mov r1,#0
loop
	cmp r1,#9
	BEQ end1
	mov r2,r1
	add r3,r1,#1
loop2
	cmp r3,#10
	beq end2
	LDR r4,[r0,r3,LSL #2]
	LDR r5,[r0,r2,LSL #2]
	cmp r4,r5
	BHI endf
	mov r2,r3
	B endf
endf
	add r3,r3,#1
	B loop2
end2
	mov r6,r5
	LDR r7,[r0,r1,LSL #2]
	STR r7,[r0,r2,LSL #2]
	STR r6,[r0,r1,LSL #2]
	B end3
end3
	add r1,r1,#1
	B loop
end1

	
dizi DCD 4,2,8,6,5,12,10,16,12,20

end