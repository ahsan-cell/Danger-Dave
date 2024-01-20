[org 0x0100]
jmp main
oldisr:		dd	0
message1 : db "Score:"
length1 : dw 6
lvl2: db "LEVEL 01"
len_lvl: dw 8
star: db "*"
head: db "o"
d1: db "-"
d2: db "-"
d3: db "|"
c1: db "__"
sp1: db " "
c2: db "O"
c3: db "("
c4: db ")"
n1: db "|"
f1: db "/"
f2: db "\"
davex: dw 16
davey: dw 21  ;floor
fell_down: dw 0
pointslabel: dw 0
scoreylabel: dw 1
portalcleared: dw 0
m1 : db "Welcome to Danger Dave"
lambai1 : dw 22
message2: db "Press Enter to Continue"
length2: dw 23
message3: db "Press Esc to Exit"
length3: dw 17
message4: db "1.Use arrow keys to move Dave"
length4: dw 29
message5: db "2.Collect as many Diamonds as you can"
length5: dw 37
message6: db "3.Scores:"
length6: dw 9
message7:db "Diamond- 100"
length7: dw 12
message8:db "Blue Ball- 150"
length8: dw 14
message9:db "Ruby- 150"
length9: dw 9
message10: db "Champions Trophy- 1000"
length10: dw 22
message11: db "4.Door opens with Champions Trophy"
length11: dw 34
trophy_found: dw 0
darwaza: dw 0
endkay: dw 12



background:
push es
push ax
push di

mov ax, 0xb800 ; load video base in ax 
mov es, ax  ; point es to video base 
mov di, 0  ; point di to top left column 
mov ah,0xC4
mov al,20
next: 
mov word [es:di], ax    ; clear next char on screen 
add di, 2       ;    move to next screen location 
cmp di, 4000     ;     has the whole screen cleared 
jne next     ;    if no clear next position 

pop di
pop ax
pop es
ret


printaadad:	
		push bp
		mov bp, sp
		push es
		push ax
		push bx
		push cx
		push dx
		push di
		mov ax, 0xb800
		mov es, ax
		mov ax, [bp+4]
		mov bx, 10
		mov cx, 0

agladad:	

		mov dx, 0
		div bx
		add dl, 0x30
		push dx
		inc cx
		cmp ax, 0
		jnz agladad
		Mov ax , 0xb800
		Mov es, ax
		Mov al, 80
		Mul byte [endkay]    ;y
		Add ax, 39  ;adding x
		add ax, 1
		Shl ax, 1
		Mov di, ax
		

aglijagah:	
		pop dx
		mov dh, 0x049
		mov [es:di], dx
		add di, 2
		loop aglijagah

		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop bp
		ret 2



welcome:
push bp
push ax
push bx
push cx
push dx
push es
push di

call background ; call the clrscr subroutine 
Mov ax,1
Push ax
Mov ax,0
Push ax
Call border
mov ax, 28
push ax ; push x position 
mov ax, 3
push ax ; push y position 
mov ax, 0xF9 ; blue on black attribute 
push ax ; push attribute 
mov ax, m1 
push ax ; push address of message 
push word [lambai1] ; push message length 
call printstr ; call the printstr subroutine 

mov ax, 28
push ax ; push x position 
mov ax, 10
push ax ; push y position 
mov ax,  0x49 ; blue on black attribute 
push ax ; push attribute 
mov ax, message2
push ax ; push address of message 
push word [length2] ; push message length 
call printstr ; call the printstr subroutine 


mov ax, 31
push ax 
mov ax, 12
push ax 
mov ax,  0x49
push ax 
mov ax, message3
push ax  
push word [length3] 
call printstr 

mov ax, 2
push ax 
mov ax, 16
push ax 
mov ax,  0x49
push ax 
mov ax, message4
push ax  
push word [length4] 
call printstr 

mov ax, 2
push ax 
mov ax, 17
push ax 
mov ax,  0x49
push ax 
mov ax, message5
push ax  
push word [length5] 
call printstr 

mov ax, 2
push ax 
mov ax, 18
push ax 
mov ax,  0x49
push ax 
mov ax, message6
push ax  
push word [length6] 
call printstr 

mov ax, 4
push ax 
mov ax, 19
push ax 
mov ax,  0x49
push ax 
mov ax, message7
push ax  
push word [length7] 
call printstr 

mov ax, 4
push ax 
mov ax, 20
push ax 
mov ax,  0x49
push ax 
mov ax, message8
push ax  
push word [length8] 
call printstr 

mov ax, 4
push ax 
mov ax, 21
push ax 
mov ax,  0x49 
push ax 
mov ax, message9
push ax  
push word [length9] 
call printstr 

mov ax, 4
push ax 
mov ax, 22
push ax 
mov ax,  0x49 
push ax 
mov ax, message10
push ax  
push word [length10] 
call printstr 

 
mov ax, 2
push ax 
mov ax, 23
push ax 
mov ax,  0x49 
push ax 
mov ax, message11
push ax  
push word [length11] 
call printstr 


pop di
pop es
pop dx
pop cx
pop bx
pop ax
pop bp
ret


checkdoor:
push bp
mov bp, sp 
push bx
push es
push ax
push dx
push di 
push si
push ds



Mov ax , 0xb800
Mov es, ax
mov ds,ax 
Mov al, 80

Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
shl ax, 1
mov di, ax 
mov si, di 
lodsw
;mov dx, [es:di]

;code
;mov word [es:di] , 0x072a

cmp word [es:di] , 0x2f7c

;cmp ax , 0x072a
jne shaba
;mov word [es:di], 0x0720

mov word [bp + 8] , 1
mov ax, [bp + 8]

shaba:
pop ds
pop si
pop di
pop dx
pop ax
pop es
pop bx
pop bp
ret 4


border:
push bp
mov bp,sp
push ax
push bx
push cx
push dx
push di
push es
mov bx,80 ;length
mov dx,22 ;width
mov ax,0xb800
mov es,ax
;calculating address
mov al,80
mul byte [bp+6]
add ax,[bp+4]

shl ax,1
mov di,ax

mov ah,0x6E ;blue
mov al,0x24 ; ascii of space
mov cx,bx ;cx as a counter
loop1:
mov [es:di],ax
add di,2
sub cx,1
jnz loop1
sub di,2
add di,160
mov cx,dx
loop2:
mov [es:di],ax
add di,160
sub cx,1
jnz loop2
;sub di,2
mov cx,bx
loop3:
mov [es:di],ax
sub di,2
sub cx,1
jnz loop3
add di,2
sub di,160
mov cx,dx
loop4:
mov [es:di],ax
sub di,160
sub cx,1
jnz loop4

pop es
pop di
pop dx
pop cx
pop bx
pop ax
pop bp
ret 4


clrdimension:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
mov ax, 0x0720
mov word [es:di], ax
add di, 160
mov word [es:di] , ax

add di, 2
mov word [es:di], ax
sub di, 160
mov word [es:di], ax
add di, 2
mov word [es:di], ax
add di, 160
mov word [es:di], ax
sub di, 6
mov word [es:di], ax
sub di, 160
mov word [es:di], ax
sub di, 2
mov word [es:di], ax
add di, 160
mov word [es:di], ax
sub di, 2
mov word [es:di], ax
sub di, 160 
mov word [es:di], ax
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 4


checkball:
push bp
mov bp, sp 
push bx
push es
push ax
push dx
push di 
push si
push ds
push cx

Mov ax , 0xb800
Mov es, ax
mov ds,ax 
Mov al, 80

Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
shl ax, 1
mov di, ax 
mov si, di 
lodsw
;mov dx, [es:di]
;mov word [es:0142h] , ax
cmp word [es:di] , 0x5f29
jne nikalball
;mov word [es:di], 0x0720

mov word [bp + 8] , 1
mov ax, [bp + 8]

nikalball:
pop cx
pop ds
pop si
pop di
pop dx
pop ax
pop es
pop bx
pop bp
ret 4

clrpurpleball:

push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di
push bx

mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax

mov ax, 0x0720

mov [es:di], ax
add di, 2

mov ax, 0x0720
mov [es:di], ax
add di, 2

mov ax, 0x0720
mov [es:di], ax
add di, 2
pop bx
pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4



clearruby:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
mov ax, 0x0720
mov cx , 3


clrrubyl:
mov [es:di], ax
add di, 2
loop clrrubyl



Mov ax , 0xb800
Mov es, ax
Mov al, 80
add word [bp  + 4] , 1
Mul byte [bp + 4] 
Add ax, [bp + 6]      
add ax, 2
Shl ax, 1
mov di, ax

mov ax, 0x0720
mov[es: di], ax
add di , 2

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4


checkruby:
push bp
mov bp, sp 
push bx
push es
push ax
push dx
push di 
push si
push ds
push cx

Mov ax , 0xb800
Mov es, ax
mov ds,ax 
Mov al, 80

Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
shl ax, 1
mov di, ax 
mov si, di 
lodsw
;mov dx, [es:di]
;mov word [es:0142h] , ax

cmp word [es:di] , 0x0c2a
jne nikalruby
;mov word [es:di], 0x0720

mov word [bp + 8] , 1
mov ax, [bp + 8]

nikalruby:
pop cx
pop ds
pop si
pop di
pop dx
pop ax
pop es
pop bx
pop bp
ret 4


cleardiamond:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax



mov cx , 3


clrdi:
mov ax, 0x0720
mov [es:di], ax
add di, 2
loop clrdi



Mov ax , 0xb800
Mov es, ax
Mov al, 80
add word [bp  + 4] , 1
Mul byte [bp + 4] 
Add ax, [bp + 6]      
add ax, 2
Shl ax, 1
mov di, ax
    

mov ax, 0x0720
mov[es: di], ax
add di , 2

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4 

checkdiamond:
push bp
mov bp, sp 
push bx
push es
push ax
push dx
push di 
push si
push ds

;

Mov ax , 0xb800
Mov es, ax
mov ds,ax 
Mov al, 80

Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
shl ax, 1
mov di, ax 
mov si, di 
lodsw
;mov dx, [es:di]

;code
;mov word [es:di] , 0x072a

cmp word [es:di] , 0x072a

;cmp ax , 0x072a
jne nikaldise
;mov word [es:di], 0x0720

mov word [bp + 8] , 1
mov ax, [bp + 8]

nikaldise:
pop ds
pop si
pop di
pop dx
pop ax
pop es
pop bx
pop bp
ret 4

clrportal:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
mov ax, 0x0720

mov [es:di], ax
add di, 2
mov ax, 0x0720
mov [es:di], ax
add di ,2
mov [es:di] ,ax 
add di, 2

mov ax, 0x0720
mov [es:di], ax



mov[es:di] ,ax
add di, 160
sub di, 6

mov ax, 0x0720
mov [es:di], ax

add di, 2
mov ax, 0x0720
mov [es:di], ax
add di, 2
mov [es:di], ax
add di, 2

mov ax, 0x0720
mov [es:di], ax

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4


printnum:	
		push bp
		mov bp, sp
		push es
		push ax
		push bx
		push cx
		push dx
		push di
		mov ax, 0xb800
		mov es, ax
		mov ax, [bp+4]
		mov bx, 10
		mov cx, 0

nextdigit:	

		mov dx, 0
		div bx
		add dl, 0x30
		push dx
		inc cx
		cmp ax, 0
		jnz nextdigit
		Mov ax , 0xb800
		Mov es, ax
		Mov al, 80
		Mul byte [scoreylabel]    ;y
		Add ax, 5    ;adding x
		add ax, 1
		Shl ax, 1
		Mov di, ax
		

nextpos:	
		pop dx
		mov dh, 0x049
		mov [es:di], dx
		add di, 2
		loop nextpos

		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop bp
		ret 2



sleep: 
push cx
mov cx, 0xFFFF
delay: loop delay
pop cx
ret

brick_border:
push bp
mov bp,sp
Sub sp,6
push ax
push bx
push cx
push dx
push di
push es
Mov word [bp-2],2
mov word [bp-4],0
mov word [bp-6],2
mov bx,80 ;length
mov dx,21 ;width
brick_border_loop:
mov ax,0xb800
mov es,ax
;calculating address
mov al,80
mul byte [bp-6]
add ax,[bp-4]

shl ax,1
mov di,ax

mov ah,0x4C 
mov al,0x23 
mov cx,bx ;cx as a counter
chakar1:
mov [es:di],ax
add di,2
sub cx,1
jnz chakar1
sub di,2
add di,160
mov cx,dx
chakar2:
mov [es:di],ax
add di,160
sub cx,1
jnz chakar2
;sub di,2
mov cx,bx
chakar3:
mov [es:di],ax
sub di,2
sub cx,1
jnz chakar3
add di,2
sub di,160
mov cx,dx
chakar4:
mov [es:di],ax
sub di,160
sub cx,1
jnz chakar4

add word[bp-6],1
add word [bp-4],1
sub dx,2
sub bx,2
Mov cx,[bp-2]
Sub cx,1
Mov [bp-2],cx
Cmp cx,0
Jne brick_border_loop

pop es
pop di
pop dx
pop cx
pop bx
pop ax
Add sp,6
pop bp
ret 

show_brick:
push bp
mov bp,sp
push ax
push cx
push di
push es

;calculating address
mov al,80
mul byte [bp+6]
add ax,[bp+4]

shl ax,1
mov di,ax
mov ax,0xb800
mov es,ax
mov ah,0x4C 
mov al,0x23 

mov cx,4 ;length

show_brick_loop:
mov [es:di],ax
add di,2
loop show_brick_loop

sub di,8
add di,160
mov cx,4

show_brick_loop2:
mov [es:di],ax
add di,2
loop show_brick_loop2

pop es
pop di
pop cx
pop ax
pop bp
ret 4

diamond:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, star      ;esteric

Mov ah, 0x07  ;attribute
mov cx , 3


line1:
mov al, [si]
mov [es:di], ax
add di, 2
loop line1



Mov ax , 0xb800
Mov es, ax
Mov al, 80
add word [bp  + 4] , 1
Mul byte [bp + 4] 
Add ax, [bp + 6]      
add ax, 2
Shl ax, 1
mov di, ax
Mov si, star        

Mov ah, 0x07
mov al, [si]
mov[es: di], ax
add di , 2

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4 



ruby:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, star      ;esteric

Mov ah, 00001100b  ;attribute
mov cx , 3


ruby_line1:
mov al, [si]
mov [es:di], ax
add di, 2
loop ruby_line1



Mov ax , 0xb800
Mov es, ax
Mov al, 80
add word [bp  + 4] , 1
Mul byte [bp + 4] 
Add ax, [bp + 6]      
add ax, 2
Shl ax, 1
mov di, ax
Mov si, star        

Mov ah, 00001100b
mov al, [si]
mov[es: di], ax
add di , 2

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4 

door:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, n1


Mov ah, 00101111b ;attribute
mov al, [si]
mov [es:di], ax
sub di, 160
add di, 2
mov si, sp1
Mov ah, 0x07 ;attribute
mov al, [si]
mov [es:di], ax
add di ,2
mov [es:di] ,ax 
add di, 160
add di, 2

mov si , n1
mov ah, 00101111b
mov al, [si]
mov [es:di], ax
sub di, 4
Mov ah, 00101111b
mov al, 0x20
mov [es:di], ax
add di,2
mov[es:di] ,ax
add di, 160
sub di, 4

mov si , n1
mov ah, 00101111b
mov al, [si]
mov [es:di], ax

add di, 2
mov si, sp1
Mov ah, 00101111b ;attribute
mov al, [si]
mov [es:di], ax
add di, 2
mov [es:di], ax
add di, 2

mov si , n1
mov ah, 00101111b
mov al, [si]
mov [es:di], ax

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4


better_entry:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, n1     ;straight line 


Mov ah, 01001111b ;attribute
mov al, [si]
mov [es:di], ax
add di, 2
mov si, 0x40     
Mov ah, 10011100b ;attribute
mov al, [si]
mov [es:di], ax
add di ,2
mov [es:di] ,ax 
add di, 2

mov si , n1
mov ah, 01001111b 
mov al, [si]
mov [es:di], ax

Mov ah, 01001111b 

mov[es:di] ,ax
add di, 160
sub di, 6

mov si , n1
mov ah, 01001111b 
mov al, [si]
mov [es:di], ax

add di, 2
mov si, 0x40    ;@ ascii
Mov ah, 10011100b ;attribute
mov al, [si]
mov [es:di], ax
add di, 2
mov [es:di], ax
add di, 2

mov si , n1
mov ah, 01001111b 
mov al, [si]
mov [es:di], ax

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4

dave:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, d1     ;dave ka left baazu aur taang

Mov ah, 0x07  ;attribute
mov al, [si]
mov [es:di], ax
add di, 2     




sub di , 160
Mov si, head   
mov al, [si]   
mov [es:di], ax         ;dave ka sar
Mov ah, 0x07



add di, 160
mov si, d3
mov ah, 11011110b
mov al, [si]
mov [es:di], ax
add di, 2    


mov si, d2
Mov ah, 0x07
mov al, [si]          ;dave ka right baazu aur taang
mov[es: di], ax
add di , 160
sub di, 4

mov si, f1
mov ah, 0x07
mov al, [si]
mov [es:di], ax

add di, 4


mov si, f2
mov ah, 0x07
mov al, [si]
mov [es:di], ax


pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4




trophy:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax

mov ah,01101110b
mov al,0x24

mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax

add di,158
mov al,0x7C

mov [es:di],ax


 
pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4

printstr:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 10]
Add ax, [bp + 12]
Shl ax, 1
Mov di, ax
Mov si, [bp + 6]
Mov cx, [bp + 4]
Mov ah, [bp + 8]

nextchar: 
Mov al, [si]
mov [es:di], ax
add di, 2 
add si, 1 ; move to next char in string 
loop nextchar ; repeat the operation cx times 
pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 10 


frontend:
push ax
push bx
push cx
push dx

call clrscr

mov ax, 0
Push ax
Mov ax, 1
Push ax
mov ax, 0x49
push ax
mov ax, message1
push ax
push word [length1]
Call printstr

mov ax, 72
Push ax
Mov ax, 1
Push ax
mov ax, 0x49
push ax
mov ax, lvl2
push ax
push word [len_lvl]
Call printstr


call brick_border

mov ax,13
push ax
mov ax,2
push ax
call show_brick





mov ax,13
push ax
mov ax,74
push ax
call show_brick

mov ax,13
mov bx,18
mov cx,3

push ax
push bx
call show_brick
add bx,20

push ax
push bx
call show_brick
add bx,20

push ax
push bx
call show_brick
add bx,20


mov cx,4
mov ax,18
mov bx,17

push ax
push bx
call show_brick


push ax
mov bx,21
push bx
call show_brick
add bx,4

push ax
mov bx,25
push bx
call show_brick


push ax
mov bx,29
push bx
call show_brick




mov ax,21
push ax
mov ax,40
push ax
call show_brick

mov ax,20
push ax
mov ax,40
push ax
call show_brick

mov cx,8
mov ax,18
mov bx,40
l2:
push ax
push bx
call show_brick
add bx,4
loop l2


mov cx,4
mov ax,8
mov bx,12

push ax
push bx
call show_brick



push ax 
mov bx,32
push bx
call show_brick


push ax
mov bx,45
push bx
call show_brick


push ax
mov bx,65
push bx
call show_brick
add bx,18


;--------------diamonds
mov ax,2
push ax
mov ax,11
push ax
call diamond

mov ax,2
push ax
mov ax,15
push ax
call diamond

mov ax,29
push ax
mov ax,16
push ax
call diamond

mov ax,74
push ax
mov ax,11
push ax
call diamond


mov ax,11
mov bx,18
mov cx,3
l5:
push bx
push ax
call diamond
add bx,20
loop l5

mov ax,11
push ax
mov ax,6
push ax
call diamond

mov ax,31
push ax
mov ax,6
push ax
call diamond

mov ax,65
push ax
mov ax,6
push ax
call diamond



mov ax,2
push ax
mov ax,21
push ax
call better_entry

mov ax,45
push ax
mov ax,6
push ax
call trophy

mov ax,44
push ax
mov ax,21
push ax
call door

mov ax,74
push ax
mov ax,4
push ax
call ruby

mov ax,1
push ax
mov ax,4
push ax 
call purpleball

pop dx
pop cx
pop bx
pop ax
ret

purpleball:

push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, c3

mov ah, 01011111b ;attribute
mov al, [si]
mov [es:di], ax
add di, 2

mov si, c2
mov ah, 01011001b ;attribute
mov al, [si]
mov [es:di], ax
add di, 2

mov si, c4
mov ah, 01011111b  ;attribute
mov al, [si]
mov [es:di], ax
add di, 2

pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4


clrscr:
push es
push ax
push di

mov ax, 0xb800 ; load video base in ax 

mov es, ax  ; point es to video base 
mov di, 0  ; point di to top left column 
nextloc: 

mov word [es:di], 0x0720    ; clear next char on screen 
add di, 2       ;    move to next screen location 
cmp di, 4000     ;     has the whole screen cleared 
jne nextloc    ;    if no clear next position 
pop di
pop ax
pop es 
ret



checkbrick:
push bp
mov bp, sp 
push bx
push es
push ax
push dx
push di 
push si
push ds

Mov ax , 0xb800
Mov es, ax
mov ds,ax 
Mov al, 80

Mul byte [bp + 6]    ;y
Add ax, [bp + 4]    ;adding x
shl ax, 1
mov di, ax 
mov si, di 
lodsw
;mov dx, [es:di]
cmp word [es:di] , 0x4c23
jne nikal
;mov word [es:di], 0x0720

mov word [bp + 8] , 1
mov ax, [bp + 8]

nikal:
pop ds
pop si
pop di
pop dx
pop ax
pop es
pop bx
pop bp
ret 4


checktrophy:
push bp
mov bp, sp 
push bx
push es
push ax
push dx
push di 
push si
push ds

Mov ax , 0xb800
Mov es, ax
mov ds,ax 
Mov al, 80

Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
shl ax, 1
mov di, ax 
mov si, di 
lodsw
;mov dx, [es:di]
;mov word [es:0142h] , ax
Mov ax , 0xb800
		
	
cmp word [es:di] , 0x6e24
jne nikaltrop
;mov word [es:di], 0x0720

mov word [bp + 8] , 1
mov ax, [bp + 8]

nikaltrop:
pop ds
pop si
pop di
pop dx
pop ax
pop es
pop bx
pop bp
ret 4


clear_dave:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax
Mov si, d1     ;dave ka left baazu aur taang

mov ax,0x0720
mov [es:di], ax
add di, 2     




sub di , 160
Mov si, head      
mov [es:di], ax         ;dave ka sar




add di, 160
mov si, d3

mov [es:di], ax
add di, 2    


mov si, d2
mov[es: di], ax
add di , 160
sub di, 4

mov si, f1
mov [es:di], ax

add di, 4


mov si, f2
mov [es:di], ax


pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4

clrtrophy:
push bp 
Mov bp, sp
Push es
Push ax
Push cx
Push si 
Push di

Mov ax , 0xb800
Mov es, ax
Mov al, 80
Mul byte [bp + 4]    ;y
Add ax, [bp + 6]    ;adding x
add ax, 1
Shl ax, 1
Mov di, ax

mov ax, 0x0720

mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax

add di,158
mov ax, 0x0720
mov [es:di],ax


 
pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4



move_right:
push ax
push bx
push cx
push dx

mov ax,0
push ax
mov ax,[davey]
push ax
mov ax,[davex]
add ax,5
push ax
call checkbrick
pop ax
cmp ax,1
jne  skip
jmp no_right

skip:
mov ax,0
push ax
mov ax,[davey]
sub ax,1
push ax
mov ax,[davex]
add ax,5
push ax
call checkbrick
pop ax
cmp ax,1
jne skip2
jmp no_right

skip2:
;-------------
;trophy check
mov ax,0
push ax
mov ax,[davex]
add ax,5
push ax
mov ax,[davey]
push ax
call checktrophy
pop ax
cmp ax,1
je t_mill_gyi

mov ax,0
push ax
mov ax,[davex]
add ax,5
push ax
mov ax,[davey]
sub ax,1
push ax
call checktrophy
pop ax
cmp ax,1
je t_mill_gyi
;diamond

mov ax,0
push ax
mov bx,[davex]
add bx,5
push bx
mov cx,[davey]
push cx
call checkdiamond
pop ax
cmp ax,1
je diamond_found

mov ax,0
push ax
mov bx,[davex]
add bx,5
push bx
mov cx,[davey]
sub cx,1
push cx
call checkdiamond
pop ax
cmp ax,1
je diamond_found



mov ax,[davex]
push ax
mov ax,[davey]
push ax
call clear_dave

;
add word [davex],2

mov ax,[davex]
push ax
mov ax,[davey]
push ax
call dave

jmp no_right

t_mill_gyi:
mov word [trophy_found],1
add word [pointslabel],1000
mov ax,45
push ax
mov ax,6
push ax
call clrtrophy
jmp move_r_now
diamond_found:
add word [pointslabel],100
sub bx,1
push bx
push cx
call cleardiamond
jmp move_r_now

move_r_now:
mov ax,[davex]
push ax
mov ax,[davey]
push ax
call clear_dave

;
add word [davex],2

mov ax,[davex]
push ax
mov ax,[davey]
push ax
call dave

no_right:
pop dx
pop cx
pop bx
pop ax
ret

move_left:
push ax
push bx
push cx
push dx

mov ax,0
push ax
mov ax,[davey]
push ax
mov ax,[davex]
sub ax,1
push ax
call checkbrick
pop ax
cmp ax,1
jne skip3
jmp no_left
skip3:
mov ax,0
push ax
mov ax,[davey]
sub ax,1
push ax
mov ax,[davex]
sub ax,1
push ax
call checkbrick
pop ax
cmp ax,1
jne skip9
jmp no_left

skip9:
;diamondss
mov ax,0
push ax
mov bx,[davex]
sub bx,1
push bx
mov cx,[davey]
push cx
call checkdiamond
pop ax
cmp ax,1
jne skip10
jmp diamond_found2

skip10:
mov ax,0
push ax
mov bx,[davex]
sub bx,1
push bx
mov cx,[davey]
add cx,1
push cx
call checkdiamond
pop ax
cmp ax,1
je diamond_found2

mov ax,0
push ax
mov bx,[davex]
sub bx,2
push bx
mov cx,[davey]
push cx
call checkdoor
pop ax
cmp ax,1
je doorfound


mov ax,0
push ax
mov bx,[davex]
sub bx,1
push bx
mov cx,[davey]
push cx
call checkdoor
pop ax
cmp ax,1
je doorfound


mov ax,[davex]
push ax
mov ax,[davey]
push ax
call clear_dave
sub word [davex],2
mov ax,[davex]
push ax
mov ax,[davey]
push ax
call dave
jmp no_left

doorfound:
cmp word [trophy_found],1
jne nhi
mov word [darwaza],1
nhi:
jmp no_left


diamond_found2:
add word [pointslabel],100
sub bx,3
push bx
push cx
call cleardiamond

mov ax,[davex]
push ax
mov ax,[davey]
push ax
call clear_dave
sub word [davex],2
mov ax,[davex]
push ax
mov ax,[davey]
push ax
call dave

no_left:
pop dx
pop cx
pop bx
pop ax
ret

jump_dave:
push ax
push bx
push cx
push dx

mov dx,8
jumping:

mov ax,0
push ax
mov ax,[davey]
sub ax,2
push ax
mov ax,[davex]
add ax,1
push ax
call checkbrick
pop ax
cmp ax,1
jne skip4
jmp no_jump
skip4:
mov ax,0
push ax
mov ax,[davey]
sub ax,2
push ax
mov ax,[davex]
add ax,3
push ax
call checkbrick
pop ax
cmp ax,1
jne skip5
jmp no_jump
skip5:
;diamondss
mov ax,0
push ax
mov bx,[davex]
add bx,1
push bx
mov cx,[davey]
sub cx,2
push cx
call checkdiamond
pop ax
cmp ax,1
je dia_found3

;ruby
mov ax,0
push ax
mov bx,[davex]
add bx,1
push bx
mov cx,[davey]
sub cx,2
push cx
call checkruby
pop ax
cmp ax,1
je ruby_found
;purpleball
mov ax,0
push ax
mov bx,[davex]
add bx,2
push bx
mov cx,[davey]
sub cx,2
push cx
call checkball
pop ax
cmp ax,1
je ball_found



jmp agay_chalo
dia_found3:
add word [pointslabel],100
sub bx,1
push bx
;sub cx,1
push cx
call cleardiamond
jmp agay_chalo
ruby_found:
add word [pointslabel],150
sub bx,1
push bx
;sub cx,1
push cx
call clearruby
jmp agay_chalo
ball_found:
add word [pointslabel],150
sub bx,3
push bx
push cx
call clrpurpleball
jmp agay_chalo

agay_chalo:
mov ax,[davex]
push ax
mov ax,[davey]
push ax
call clear_dave


mov word [fell_down],0
sub word [davey],1

mov ax,[davex]
push ax
mov ax,[davey]

push ax
call dave
call sleep
call sleep
sub dx,1
jnz jumping

no_jump:
pop dx
pop cx
pop bx
pop ax
ret

fall_down:
push ax
push bx
push cx
push dx

mov word [fell_down],1

;mov dx,21

check:

mov ax,0
push ax
mov ax,[davey]
add ax,2
push ax
mov ax,[davex]
add ax,1
push ax
call checkbrick
pop ax
cmp ax,1
jne skip6
jmp exit

skip6:
mov ax,0
push ax
mov ax,[davey]
add ax,2
push ax
mov ax,[davex]
add ax,2
push ax
call checkbrick
pop ax
cmp ax,1
jne skip7
jmp exit

skip7:
mov ax,0
push ax
mov ax,[davey]
add ax,2
push ax
mov ax,[davex]
add ax,3
push ax
call checkbrick
pop ax
cmp ax,1
jne skip8
jmp exit

skip8:
;chekdiamond
mov ax,0
push ax
mov bx,[davex]
add bx,1
push bx
mov cx,[davey]
add cx,2
push cx
call checkdiamond
pop ax
cmp ax,1
je diamond_found3

mov ax,0
push ax
mov bx,[davex]
add bx,2
push bx
mov cx,[davey]
add cx,2
push cx
call checkdiamond
pop ax
cmp ax,1
je diamond_found3


mov ax,0
push ax
mov bx,[davex]
add bx,3
push bx
mov cx,[davey]
add cx,2
push cx
call checkdiamond
pop ax
cmp ax,1
je diamond_found3

jmp girtay_raho
diamond_found3:
add word [pointslabel],100
push bx
push cx
call clrdimension
call brick_border

;cmp word [davey],21
;je exit

girtay_raho:
mov ax,[davex]
push ax
mov ax,[davey]
push ax
call clear_dave

add word [davey],1

mov ax,[davex]
push ax
mov ax,[davey]
push ax
call dave
call sleep
call sleep
jmp check

exit:
pop dx
pop cx
pop bx
pop ax
ret






kbisr:	push ax
		push es
		mov ax, 0xb800
		mov es, ax

		in al, 0x60
		cmp al, 0x4D
		jne nextcmp
        call move_right  
		
		
        jmp nomatch

nextcmp:	cmp al, 0x4B
		    jne nextcmp2
			call move_left
			jmp nomatch

nextcmp2:      cmp al, 0x48
               jne nomatch
			   cmp word [fell_down],1
			   jne nomatch
               call jump_dave
               
			   
			   
nomatch:	

		pop es
		pop ax
		jmp far [cs:oldisr]
		


main:

         xor ax, ax
		mov es, ax
		mov ax, [es:9*4]
		mov [oldisr], ax
		mov ax, [es:9*4+2]
		mov [oldisr+2], ax
		cli
		mov word [es:9*4], kbisr
		mov [es:9*4+2], cs
		sti
		mov al,0
		call clrscr
		call welcome
wapis:
		mov ah,0
        int 0x16
        cmp al,0
		je wapis
        call clrscr
		call frontend
		mov ax,[davex]
        push ax
        mov ax,[davey]
        push ax
		call dave
        mov ah,0
        int 0x16
		mov ax,2
		push ax
		mov ax,21
		push ax
		call clrportal


infinite:
call fall_down
mov ax,[pointslabel]
push ax
call printnum
cmp word [darwaza],1
je khatam
mov ah,0
int 0x16
cmp al,27
jne infinite
      
unhook:
		mov ax, [oldisr]
		mov bx, [oldisr+2]
		cli
		mov [es:9*4], ax
		mov [es:9*4+2], bx
  		sti
        jmp bye
khatam:
        call clrscr
		call background ; call the clrscr subroutine 
Mov ax,1
Push ax
Mov ax,0
Push ax
Call border

mov ax, 34
Push ax
Mov ax, 12
Push ax
mov ax, 0x49
push ax
mov ax, message1
push ax
push word [length1]
Call printstr

mov ax, [pointslabel]
push ax
call printaadad


		jmp unhook
bye:
mov ax,0x4c00
int 21h