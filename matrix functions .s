	TTL lap
	AREA program,Code , READWRITE
	ENTRY

	ldr r1,=matrix
	A sikki 
	BL enBuyukElmani;----> R2 
	B sikki
	mov r0,#1 ; matrix[r0] 
	mov r10,#5 ; 5*5 matrix 
	mul r4,r0,r10 ;loop baslangic 
	add r9,r0,#1
	mul r8,r9,r10 ; loop bitisi
	
	ldr r5,[r1,r4,lsl #2 ]; enKucuk
	add r4,r4,#1 ; i++;
loop1
	cmp r4,r8
	beq loop1end
	ldr r6,[r1,r4,lsl #2] ; matrix[i]
	cmp r6,r5 ;if (matrix[i]<enKucuk)
	bhs kucuk
	mov r5,r6 ; enKucuk=matrix[i]
kucuk
	add r4,r4,#1 ;i++
	B loop1
loop1end
	
	3.Sikki 
	BL enBuyukToplam ;--->R7
	
enBuyukElmani
	STMFD SP!,{R1-R2,LR}
	mov r3,#1 ; i =0
	ldr r2,[r1,#0] ;enBuyuk=matrix[0]
loop
	cmp r3,#25 ;if matrix.length==i
	beq loopEnd
	ldr r5,[r1,r3,lsl #2] ;temp=matrx[i]
	cmp r5,r2
	bls dal1
	mov r2,r5 ; enBuyuk=temp
dal1
	add r3,r3,#1
	B loop 
loopEnd
	LDMFD SP!,{R1-R2,pc}	


enBuyukToplam
	STMFD sp!,{r1,r7,lr}
	mov r3,#0 ; i=0
	mov r10,#5 ; 5*5 matrixi
loopBuyuk
	mul r8,r3,r10 ;satir baslangic
	add r3,r3,#1
	mul r9,r3,r10 ;satir bitisi
	sub r3,r3,#1 
	mov r4,#0 ;temp =0
	cmp r3,#6 ; if(i>=satir.length) goto(EnSonEnd)
	beq enSonEnd
	mov r6,r8 ; j=satir baslangic
satirTopla	
	cmp r9,r6 ;if(satir bitisi ==j) goto(endBir)
	beq endBir
	ldr r5,[r1,r6,lsl #2] ;matrix[j]
	add r4,r4,r5 ; temp+=matrix[j]
	add r6,r6,#1 ;j++;
	B satirTopla 
endBir
	cmp r7,r4 ;if(EnBuyukToplam<temp) 
	bhs degil
	mov r7,r4; EnBuyukToplam=temp
degil
	add r3,r3,#1
	B loopBuyuk
enSonEnd
	LDMFD sp!,{r1,r7,pc}
	
	
matrix dcd 4,5,7,9,1,7,8,6,4,3,1,3,7,9,6,9,5,9,8,2,2,4,6,8,10 ; 5x5 matix 
																4,5,7,9,1 toplami 1A =26
																7,8,6,4,3 toplami 1C =28
																1,3,7,9,6 toplami 1A =26
																9,5,9,8,2 toplami 21=33
																2,4,6,8,10 toplami 1E=30
														
	end