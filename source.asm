INCLUDE Irvine32.inc
INCLUDE Macros.inc



includelib winmm.lib

PlaySound PROTO,
pszSound:PTR BYTE,
hmod : DWORD,
fdwSound : DWORD



.data
;///////////SOUND/////////////////
SND_FILENAME DWORD 00020000h
SND_LOOP DWORD  00000008h
SND_ASYNC DWORD 00000001h
SND_NOSTOP DWORD 00000010h
file BYTE "pacman.wav", 0

file2 byte "coin.wav", 0

file3 byte "fruit.wav", 0
;///////////splash screen/////////////
splashScreen BYTE   "           .____   _    ____ __  __.   _   ._   _.", 0ah,
                    "           |  _ \ / \  / ___|  \/  |  / \  | \ | |", 0ah,
                    "           | |_) / _ \| |   | |\/| | / _ \ |  \| |", 0ah,
                    "           |  __/ ___ | |___| |  | |/ ___ \| |\  |", 0ah,
                    "           |_| /_/   \_\____|_|  |_/_/   \_|_| \_|", 0ah,
                    "                     Press P to Start             ", 0ah, 0

pacmanimg BYTE  "                         .::------:..", 0ah,
                "                      .:-=============-:", 0ah
          BYTE  "                    .-=======...=========:", 0ah,
                "                  -==========...===========:", 0ah
          BYTE  "                 -========================-.", 0ah,
                "                -=====================-:.   ", 0ah
          BYTE  "               :===================-:.       ", 0ah,
                "               -===============-:.           ", 0ah
          BYTE  "               -===============-:.           ", 0ah,
                "               .===================-:.       ", 0ah
          BYTE  "                -=====================-:.   ", 0ah,
                "                 -========================-.", 0ah
          BYTE  "                   :======================-. ", 0ah,
                "                    .-==================-:   ", 0ah
          BYTE  "                        :-============-:. ", 0ah,0

;///////////Menu/////////////
menuopt1 BYTE   "                    ____  _                ", 0ah,
                "                   |  _ \| | __ _ _   _ ", 0ah,
                "                   | |_) | |/ _` | | | |", 0ah,
                "                   |  __/| | (_| | |_| |", 0ah,
                "                   |_|   |_|\__,_|\__, |", 0ah,
                "                                  |___/ ", 0ah,
                "                          Press P",0ah, 0

menuopt2 BYTE   "                    _   _      _        ", 0ah,
                "                   | | | | ___| |_ __   " , 0ah,
                "                   | |_| |/ _ \ | '_ \ ", 0ah,
                "                   |  _  |  __/ | |_) |", 0ah,
                "                   |_| |_|\___|_| .__/ ", 0ah,
                "                                |_|", 0ah,
                "                          Press H", 0
menuopt3 BYTE   "				                     __  __           _ ", 0ah,
				"                   |  \/  | ___   __| |", 0ah,
				"                   | |\/| |/ _ \ / _` |", 0ah,
				"                   | |  | | (_) | (_| |", 0ah,
				"                   |_|  |_|\___/ \__,_|", 0ah,
				"                          Press S", 0

instructionslbl BYTE "                     __ __ ____ __    ___ ", 0ah,
                     "                    / // // __// /   / _ \", 0ah,
                     "                   / _  // _/ / /__ / ___/", 0ah,
                     "                  /_//_//___//____//_/    ", 0ah,0ah,0ah,0
                                                            
 
instrprompt1 BYTE "           COLLECT COINS TO INCREASE YOUR SCORE", 0ah, 0
instrprompt2 BYTE "           AVOID ENEMIES OR YOU WILL LOSE LIVES", 0ah,
                  "            LEARNING ENEMY PATTERNS IS CRUCIAL!!", 0ah, 0
instrprompt3 BYTE "                  FRUITS ADD BONUS SCORE", 0ah, 0
instrprompt4 BYTE "                  COMPLETE LEVELS TO WIN", 0ah, 0

instrprompt5 BYTE "                 PRESS W, A, S, D TO MOVE", 0ah, 0 

instrprompt6 BYTE "                 PRESS X TO EXIT THE GAME", 0ah, 0
instrprompt7 BYTE "                  PRESS P TO PAUSE GAME", 0ah,0ah, 0
instrprompt8 BYTE "                PRESS B TO GO BACK TO MENU", 0ah, 0

                                                  

;//////////////////////LEVELS////////////////////////
level1 BYTE  "             __    _______    __________       ___",0ah,
             "            / /   / ____/ |  / / ____/ /      <  /",0ah
       BYTE  "           / /   / __/  | | / / __/ / /       / /",0ah,
             "          / /___/ /___  | |/ / /___/ /___    / /",0ah
       BYTE  "         /_____/_____/  |___/_____/_____/   /_/",0ah,
             "           The Challenge - ENTER YOUR NAME   ", 0 

begingamestr BYTE "PRESS P TO BEGIN ",0ah, 0

level2 BYTE "             __    _______    __________       ___",0ah,
            "            / /   / ____/ |  / / ____/ /      |__ \",0ah
       BYTE "           / /   / __/  | | / / __/ / /       __/ /",0ah,
            "          / /___/ /___  | |/ / /___/ /___    / __/ ",0ah
       BYTE "         /_____/_____/  |___/_____/_____/   /____/ ",0ah,
			"           The Showdown - Press P to Begin           ",0ah, 0ah, 0ah, 0
                                          
level3 BYTE "             __    _______    __________       _____",0ah,
            "            / /   / ____/ |  / / ____/ /      |__  /",0ah
       BYTE "           / /   / __/  | | / / __/ / /        /_ <",0ah,
            "          / /___/ /___  | |/ / /___/ /___    ___/ /",0ah
       BYTE "         /_____/_____/  |___/_____/_____/   /____/ ",0ah,
            "            The Showdown - Press P to Begin        ", 0

 setup BYTE "             _____  ______ ______ __  __ ____", 0ah,
            "            / ___/ / ____//_  __// / / // __ \"
    BYTE    "            \__ \ / __/    / /  / / / // /_/ /", 0ah,
            "           ___/ // /___   / /  / /_/ // ____/ "
   BYTE     "          /____//_____/  /_/   \____//_/      ", 0ah,0
                                    



;//          -----------------------MAZEZ-------------------
ground  BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||",0ah
        BYTE "||||||................................................||||||",0ah,
             "||||||.|||||||||||||||||.|||||||||.||||||||||||||||||.||||||",0ah
        BYTE "||||||.|||||||||||||||||.|||||||||.||||||||||||||||||.||||||",0ah,
             "||||||.|||||||||||||||||.|||||||||.||||||||||||||||||.||||||",0ah
        BYTE "||........................................................||",0ah,
             "||.||||||.|||||||||||.||||||||||||||||.|||||||||||.||||||.||",0ah
        BYTE "||.||||||.|||||||||||.||||||||||||||||.|||||||||||.||||||.||",0ah,
             "||.||||||.|||||||||||.||||||||||||||||.|||||||||||.||||||.||",0ah
        BYTE "||.||||||.|||||...............................||||.||||||.||",0ah,
             "||.||||||.|||||.|||||||||||||| ||||||||||||||.||||.||||||.||",0ah
        BYTE "||..............|||||||||||||| ||||||||||||||.............||",0ah,
             "||||.||||||||||.|||||||||||||| ||||||||||||||.|||||||||.||||",0ah
        BYTE "||||.||||||||||.                             .|||||||||.||||",0ah,
             "||||.||||||||||.|||||||||||||| ||||||||||||||.|||||||||.||||",0ah
        BYTE "    .||||||||||.|||||||||||||| ||||||||||||||.|||||||||.    ",0ah,
             "||||.||||||||||.|||||||||||||| ||||||||||||||.|||||||||.||||",0ah
        BYTE "||||.|||............................................|||.||||",0ah,
             "||||.|||.|||||||||||||.||||||||||||||.|||||||||||||.|||.||||",0ah
        BYTE "||||.|||.|||||||||||||.||||||||||||||.|||||||||||||.|||.||||",0ah,
             "||.......|||||||||||||.||||||||||||||.|||||||||||||.......||",0ah
        BYTE "||.|||||.|||||||............................|||||||.|||||.||",0ah,
             "||.|||||.|||||||.|||||||.||||||||||.|||||||.|||||||.|||||.||",0ah
        BYTE "||.|||||.........|||||||.||||||||||.|||||||.........|||||.||",0ah,
             "||.|||||||||||||.|||||||.||||||||||.|||||||.|||||||||||||.||",0ah
        BYTE "||.|||||||||||||............................|||||||||||||.||",0ah,
             "||...............||||||||||||||||||||||||||...............||",0ah
        BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||",0ah,0


ground2 BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0ah,
             "||........................................................||", 0ah
        BYTE "||.|||||||||||||||.||||||||||||||||||||||.|||||||||||||||.||", 0ah,
             "||.|||||||||||||||.||||||||||||||||||||||.|||||||||||||||.||", 0ah
        BYTE "||.....||||......................................||||.....||", 0ah,
             "||||||.||||.||||||||||||.|||||||||||.|||||||||||.||||.||||||", 0ah
        BYTE "||||||......||||||||||||.|||||||||||.|||||||||||......||||||", 0ah,
             "||||||.||||.||||||||||||.|||||||||||.|||||||||||.||||.||||||", 0ah
        BYTE "||||||.||||.||||||||||||.|||||||||||.|||||||||||.||||.||||||", 0ah,
             "||||||.||||.|||||..........................|||||.||||.||||||", 0ah
        BYTE "||||||.||||.|||||.|||||||||||| |||||||||||.|||||.||||.||||||", 0ah,
             "||||||.||||.......|||||||||||| |||||||||||.......||||.||||||", 0ah
        BYTE "||||||.||||.|||||.|||||||||||| |||||||||||.|||||.||||.||||||", 0ah,
             "||||||........................ .......................||||||", 0ah
        BYTE "||||||.||||||||||||||.|||||||| |||||||.||||||||||||||.||||||", 0ah,
             ".......||||||||||||||.|||||||| |||||||.||||||||||||||.......", 0ah
        BYTE "||||||................................................||||||", 0ah,
             "||||||.|||||||||||||||||||||||.||||||||||||||||||||||.||||||", 0ah
        BYTE "||...........|||||||||||||||||.|||||||||||||||............||", 0ah,
             "||.|||||||||.|||||||||||||||||.|||||||||||||||.||||||||||.||", 0ah
        BYTE "||.|||||||||.|||||||||||||||||.|||||||||||||||.||||||||||.||", 0ah,
             "||.....|||||...................................||||||.....||", 0ah
        BYTE "||||||.|||||.||||||||.||||||||.|||||||.|||||||.||||||.||||||", 0ah,
             "||||||.|||||.||||||||.||||||||.|||||||.|||||||.||||||.||||||", 0ah
        BYTE "||...........||||||||.||||||||.|||||||.|||||||............||", 0ah,
             "||.|||||||||.||||||||.||||||||.|||||||.|||||||.||||||||||.||", 0ah
        BYTE "||........................................................||", 0ah,
             "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0ah, 0
 

;//COLLISION DETECTION
collisionarray BYTE 1680 dup(?)
collisionarray2 BYTE 1680 dup (?)

;// ____________VARIABLES_______________
temp byte ?

strScore BYTE "SCORE: ", 0
score word 300

strLives BYTE "Lives: ", 0
lives BYTE 3

xPos BYTE 6
yPos BYTE 2


enemyXPos BYTE 30
enemyYPos BYTE 14
eDir BYTE 1

inkyXPos BYTE 33
inkyYPos BYTE 14

clydeXPos BYTE 35
clydeYPos BYTE 14

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?
direction BYTE ?

;//////////////USER INFORMATION///////////////////

levelreached BYTE 1
username BYTE 20 dup(?), 0


; ____________MENU_______________

pause1 BYTE "Press yes to continue ", 0ah, 0
pauseCaption BYTE "Pause", 0, 0ah, 0

;/////////////Game Over/////////////
gameOver BYTE "          ________   __  _______  ____ _   _________", 0ah,
              "         / ___/ _ | /  |/  / __/ / __ \ | / / __/ _ \", 0ah
        BYTE  "        / (_ / __ |/ /|_/ / _/  / /_/ / |/ / _// , _/", 0ah,
              "        \___/_/ |_/_/  /_/___/  \____/|___/___/_/|_|", 0ah, 0ah, 0
                                             

.code
main PROC
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file
invoke PlaySound, esi, 0, eax

;//splashscreen
splashscr1:
call Clrscr
mov dl, 0
mov dh, 12
call Gotoxy
mov edx, OFFSET splashScreen
mov eax, yellow; (black * 16)
call SetTextColor
call WriteString

COMMENT @
    mov dl, 0
    mov dh, 13
    call Gotoxy
    mov edx, OFFSET pacmanimg
    call WriteString
@
call ReadChar
cmp al, "p"
je menu
jne ReadChar


menu:
call Clrscr
mov dl, 0
mov dh, 5
mov eax, yellow; (black * 16)
call SetTextColor

call Gotoxy
mov edx, OFFSET menuopt1
call WriteString

mov eax, cyan; (black * 16)
call SetTextColor
mov edx, OFFSET menuopt2
call WriteString

mov eax, magenta
call setTextColor
mov edx, offset menuopt3
call WriteString

call ReadChar
cmp al, "p"
je level1scr
call ReadChar
cmp al, "h"
je instructionspage
call ReadChar
cmp al, "s"
je setuppage
jne ReadChar


setuppage:
call Clrscr
mov dl, 0
mov dh, 7
call Gotoxy
mov edx, offset setup
mov eax, yellow; (black * 16)
call SetTextColor
call WriteString

call ReadChar
cmp al, "b"
je menu
jne ReadChar

instructionspage:
call Clrscr
mov dl, 0
mov dh, 7
call Gotoxy
mov edx, offset instructionslbl
mov eax, yellow; (black * 16)
call SetTextColor
call WriteString

mov eax, cyan; (cyan * 16)
call SetTextColor
;//instructions
mov dl, 0
mov dh, 14
call Gotoxy
mov edx, offset instrprompt1
call WriteString
mov edx, offset instrprompt2
call WriteString
mov edx, offset instrprompt3
call WriteString
mov edx, offset instrprompt4
call WriteString
mov edx, offset instrprompt5
call WriteString
mov edx, offset instrprompt6
call WriteString
mov edx, offset instrprompt7
call WriteString
mov edx, offset instrprompt8
call WriteString
call ReadChar
cmp al, "b"
je menu
jne ReadChar

;///////////////////////////////////////////////BASICS ABOVE THIS LINE///////////////////////////////////////////

;///////////////////////////////////////////////LEVEL1 Splash SCREEN ///////////////////////////////////////////
level1scr:
call Clrscr
mov dl, 0
mov dh, 10
call Gotoxy
mov edx, OFFSET level1
mov eax, yellow; (black * 16)
call SetTextColor
call WriteString
mov eax, cyan; (black * 16)
call SetTextColor

mov dl, 25
mov dh, 16
call Gotoxy

mov edx, offset username
mov ecx, 20
call ReadString

mov dl, 20
mov dh, 20
call Gotoxy
mov eax, yellow; (black * 16)
call SetTextColor

mov edx, offset begingamestr
call WriteString

call ReadChar
cmp al, "p"
je level1start
jne ReadChar

;/////////////////level2///////////////////////////
level2scr:
call Clrscr
mov dl, 0
mov dh, 10
call Gotoxy
mov edx, OFFSET level2
mov eax, blue; (black * 16)
call SetTextColor
call WriteString
mov eax, cyan; (black * 16)
call SetTextColor

MOV bl, "p"
mov eax, 3000
call Delay
;// call Readchar
cmp bl, "p"
je level2start
l3:
jmp l3

level2start:
call Clrscr
;//for start of new level. initialise new collision arr. then set the map
mov ecx, 1680
mov esi, OFFSET collisionarray2
mov edi, OFFSET ground2
jmp setuploop



level1start:
call Clrscr
;//collision array setup
mov ecx, 1680
mov esi, OFFSET collisionarray
mov edi, OFFSET ground
setuploop :
mov al, [edi]


cmp al, 10
je newline

cmp al, "|"
je addwall

cmp al, "."
je nowall

cmp al, " "
je addspace

loop setuploop
jmp gameplay

        addwall:
        mov al, 1
        mov [esi], al
        inc esi
        inc edi
        loop setuploop

        nowall:
        mov al, 0
        mov [esi], al
		inc esi
            inc edi
        loop setuploop

        addspace:
        mov al, 2
        mov [esi], al
		inc esi
            inc edi
        loop setuploop

        newline:
        inc edi

            jmp setuploop

            ;//1 is wall, 2 is space, 0 is food
    gameplay:

            ;//LEVEL CHECK TO PRINT MAP
            cmp levelreached, 1
            jg level2map

            mov esi , OFFSET ground
            jmp levelchkcomplete
        
                level2map:
            mov esi, OFFSET ground2
            ;/////////////////////////


    levelchkcomplete:
	call Clrscr
    mov dl, 0
    mov dh, 1
    call Gotoxy
    mov eax, cyan
	call SetTextColor
        xor ecx,ecx
        mov ecx, 1708
        printmazeloop:
            mov al, [esi]
            cmp al, "|"
            je printwall
            cmp al, " "
            je printspace
            cmp al, "."
            je printfood
            cmp al, 10
            je nextline

                printwall:
                mov eax, blue; (black * 16)
                call SetTextColor
                mov al, 219
                call WriteChar
                inc esi
				loop printmazeloop

                printspace:
                mov al," "
                call WriteChar
                inc esi
				loop printmazeloop

                printfood:
                mov eax, lightGray; (black * 16)
                call SetTextColor
                mov al, 249
                call WriteChar
                inc esi
				loop printmazeloop

                nextline:
                mov al, 0ah
                call WriteChar
                    mov eax, 30
                    call Delay
                inc esi
                loop printmazeloop



; draw ground at(0, 29) :
    COMMENT @
    mov eax, cyan; (black * 16)
    call SetTextColor
     mov dl, 0
     mov dh, 1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    @

    call DrawPlayer
    call DrawEnemy
    call DrawInky
    call DrawClyde
    call CreateRandomCoin
    call DrawCoin

    call Randomize
                    invoke PlaySound, 0, 0, 0
    gameLoop:
;        //lives
        mov dl, 50
        mov dh, 0
        call Gotoxy
        mov edx, OFFSET strLives
        call WriteString
        mov al, lives
        call WriteDec

		;//////////////collision////////////////
        call collisionCheck
            call collisionCheck2
           call collisionCheck3
        ;//////////////endoflevel//////////////
        cmp levelreached, 2
        je eolvl2
        xor al, al
            call endoflevel
            cmp al, 1
            jne skipover
            mov eax, 1000
            call Delay
            ;//mov score, 0
            mov levelreached,2
            mov xPos, 6
            mov yPos,2

            mov enemyXPos, 30
            mov enemyYPos, 14
            jmp level2scr
        ;/////////////////endoflevel2/////////////////////
            eolvl2:
            call endoflevel2
            cmp al, 1
            jne skipover
            mov eax, 1000
            call Delay
            call gameisover
            mov score, 0
            mov lives, 3
            mov levelreached, 1
                mov xPos, 6
                mov yPos, 2

                mov enemyXPos, 30
                mov enemyYPos, 14
            jmp splashscr1





;////////////////
        skipover:
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        add score, 5
            mov eax, SND_FILENAME;; pszSound is a file name
            or eax, SND_NOSTOP;; Play in a loop
            or eax, SND_ASYNC;; Play in the background
            mov esi , OFFSET file3
            invoke PlaySound, esi, 0, eax
        call CreateRandomCoin
        call DrawCoin 
        notCollecting:

        mov eax,magenta (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteDec       
        

        ;///enemy movement
         moveEnemy:
        call UpdateEnemy
            mov eax, 4
            call RandomRange
            inc eax

            COMMENT @
            .if eDir==1
                .if eax==2
					jmp moveEnemy
                .endif
            .endif
            
            .if eDir==2
                .if eax==1
					jmp moveEnemy
                .endif
            .endif

            .if eDir==3
                .if eax==4
					jmp moveEnemy
                .endif
            .endif

            .if eDir==4
                .if eax==3
					jmp moveEnemy
                .endif
            .endif
            @

            cmp eDir, 1
            je CheckDirection1

            cmp eDir, 2
            je CheckDirection2

            cmp eDir, 3
            je CheckDirection3

            cmp eDir, 4
            je CheckDirection4

            jmp continueEnemyMovement

            CheckDirection1 :
        cmp eax, 2
            je moveEnemy
            jmp continueEnemyMovement

            CheckDirection2 :
        cmp eax, 1
            je moveEnemy
            jmp continueEnemyMovement

            CheckDirection3 :
        cmp eax, 4
            je moveEnemy
            jmp continueEnemyMovement

            CheckDirection4 :
        cmp eax, 3
            je moveEnemy

           


            continueEnemyMovement:
            cmp eax, 1
            je emoveup
            cmp eax, 2
            je emovedown
            cmp eax, 3
            je emoveright
            cmp eax, 4
            je emoveleft


            ;//EDIR, 1 = up, 2 = down, 3 = left, 4 = right
        ;//directions: 1 = up, 2 = down, 3 = left, 4 = right
        emoveup :
             dec enemyYPos
            call Ewallcheck
            cmp eax, 1;// there was wall 
            je Edontmoveup
                mov eDir, 1
            jmp enemydrawaftermovement

                Edontmoveup: 
                inc enemyYPos
                jmp enemydrawaftermovement


        emovedown :

            inc enemyYPos
            call Ewallcheck
            cmp eax, 1
            je Edontmovedown
                ;//inc emovecount
            mov eDir, 2
            jmp enemydrawaftermovement

                Edontmovedown :
                dec enemyYPos
                jmp enemydrawaftermovement
        
        emoveleft :

            dec enemyXPos
                call enemyTeleportation
            call Ewallcheck
            cmp eax, 1
            je Edontmoveleft
                mov eDir, 4
            jmp enemydrawaftermovement

                Edontmoveleft :
                inc enemyXPos
			    jmp enemydrawaftermovement
        
        emoveright :

            inc enemyXPos
                call enemyTeleportation
            call Ewallcheck
            cmp eax, 1
            je Edontmoveright
            mov eDir, 3
            jmp enemydrawaftermovement

                Edontmoveright :
                dec enemyXPos
			    jmp enemydrawaftermovement

        enemydrawaftermovement :

        call DrawEnemy
            mov eax, 20
            call Delay
        jmp onGround;

        ;////////////////////////////

        
        onGround:

        ; get user key input:
        call ReadKey
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar, "p"
        je pauseGame
        
        jmp gameloop
        moveUp:
        call UpdatePlayer
            ;// mov esi, OFFSET collisionarray
            dec yPos
                
                call wallcheck
                cmp eax, 1;//eax 1 would mean wall
				je dontmoveup
				jmp moveUpContinue
                    dontmoveup:
                        inc yPos
                        call DrawPlayer
                        jmp gameLoop
		
            moveUpContinue:
                call foodcheck
                call removefood
                call DrawPlayer
                mov eax,20
                call Delay
        jmp gameLoop

        moveDown:
        call UpdatePlayer
        inc yPos
        
		    call wallcheck
			cmp eax, 1;//eax 1 would mean wall
            je dontmovedown
            jmp moveDownContinue
                dontmovedown :
                    dec yPos
                    call DrawPlayer
                    jmp gameLoop

        moveDownContinue:
        call foodcheck
        call removefood
        call DrawPlayer
            mov eax, 20
            call Delay
        jmp gameLoop

        moveLeft:
        call UpdatePlayer
        dec xPos
            call teleportation
		    call wallcheck
			cmp eax, 1;//eax 1 would mean wall
            je dontmoveleft
            jmp moveLeftContinue
                dontmoveleft :
                    inc xPos
                    call DrawPlayer
                    jmp gameLoop

        moveLeftContinue:
        call foodcheck
        call removefood
        call DrawPlayer
            mov eax, 20
            call Delay
        jmp gameLoop

        moveRight:
        call UpdatePlayer
        inc xPos
            call teleportation
		    call wallcheck
			cmp eax, 1;//eax 1 would mean wall
            je dontmoveright
            jmp moveRightContinue
                dontmoveright :
                    dec xPos
                    call DrawPlayer
                    jmp gameLoop

        moveRightContinue:
        call foodcheck
        call removefood
        call DrawPlayer
			mov eax, 20
			call Delay
        jmp gameLoop

            pauseGame:
        
        mov edx,OFFSET pause1
        mov ebx,OFFSET pauseCaption
        call MsgBoxAsk
        cmp eax, IDNO
            jne gameLoop
            cmp eax, IDYES
            jne PauseGame

    jmp gameLoop

    exitGame:
        exit
            main ENDP

            DrawPlayer PROC
            ; draw player at(xPos, yPos) :
            mov eax, yellow; (blue * 16)
            call SetTextColor
            mov dl, xPos
            mov dh, yPos
            call Gotoxy
            mov al, 243
            call WriteChar
            ret
            DrawPlayer ENDP

            DrawEnemy PROC
            ; draw enemy at(xPos, yPos) :
            mov eax, red; (blue * 16)
            call SetTextColor
            mov dl, enemyXPos
            mov dh, enemyYPos
            call Gotoxy
            xor eax,eax
            mov al, 234
            call WriteChar
            ret
            DrawEnemy ENDP

            DrawInky PROC
            mov eax, cyan; (blue * 16)
            call SetTextColor
            mov dl, inkyXPos
            mov dh, inkyYPos
            call Gotoxy
            mov al, 234
            call WriteChar
            ret
            DrawInky ENDP

            DrawClyde PROC
            mov eax, magenta; (blue * 16)
            call SetTextColor
            mov dl, clydeXPos
            mov dh, clydeYPos
            call Gotoxy
            mov al, 234
            call WriteChar
            ret
            DrawClyde ENDP

            UpdatePlayer PROC
            mov dl, xPos
            mov dh, yPos
            call Gotoxy
            mov al, " "
            call WriteChar
            ret
            UpdatePlayer ENDP

            UpdateEnemy PROC
            mov dl, enemyXPos
            mov dh, enemyYPos
            call Gotoxy
            mov eax, cyan; (cyan * 16)
            call SetTextColor
            call EnemyTrail;//this function puts the required character, space or "." by checking coll arr
            call WriteChar
            ret
            UpdateEnemy ENDP

            UpdateInky PROC
            mov dl, inkyXPos
            mov dh, inkyYPos
            call Gotoxy
            mov eax, cyan; (cyan * 16)
            call SetTextColor
            call EnemyTrail;//need to modift this fnction for inky and clyde
            call WriteChar
            ret
            UpdateInky ENDP

            UpdateClyde PROC
            mov dl, clydeXPos
            mov dh, clydeYPos
            call Gotoxy
            mov eax, cyan; (cyan * 16)
            call SetTextColor
            call EnemyTrail;//need to modift this fnction for inky and clyde
            call WriteChar
            ret
            UpdateClyde ENDP


            DrawCoin PROC
            mov eax, lightmagenta; (red * 16)
            call SetTextColor
            mov dl, xCoinPos
            mov dh, yCoinPos
            call Gotoxy
            mov al, 229;//, 254
            call WriteChar
            ret
            DrawCoin ENDP

            CreateRandomCoin PROC
            coincreation:
            mov eax, 59
            call RandomRange
                inc eax
                inc eax
            mov xCoinPos, al
            mov eax, 28
            call RandomRange
            inc eax
            mov yCoinPos, al

            call checkCoinPos
            cmp edx, 1;//edx is 1 means wrong position, edx 0 is correct
            je coincreation
            
            cmp edx, 0
            ret


            ret
            CreateRandomCoin ENDP

;//collision detection function that return 1 in eax if wall and 0 if not wall
            checkCoinPos PROC

            cmp levelreached, 1
            jg level2map
            mov esi , OFFSET collisionarray
                jmp continueProc
                level2map:
                mov esi, OFFSET collisionarray2

            continueProc:    
            xor eax, eax
                xor ebx, ebx
                mov al, xCoinPos
                mov bl, yCoinPos
                dec bl
                imul ebx, 60
                add eax, ebx
                ;// mov esi, OFFSET collisionarray
                    xor ebx, ebx
                    mov bl, [esi+eax]
                    cmp ebx, 1
                je newcoords
                jmp nonewcoords

                newcoords:
                mov edx, 1
                ret

                nonewcoords:
                mov edx,0
                ret
                
            checkCoinPos ENDP


foodcheck PROC

            cmp levelreached, 1
            jg level2map
            mov esi , OFFSET collisionarray
                jmp continueProc
                level2map:
                mov esi, OFFSET collisionarray2

            continueProc: 

xor eax, eax
xor ebx, ebx
mov al, xPos
mov bl, yPos
dec bl
imul ebx, 60
    add eax, ebx
;//	mov esi, OFFSET collisionarray
        xor ebx, ebx
    mov bl, [esi+eax]
    cmp ebx, 0
    je isFood
    jmp isntFood

    isFood:
        inc score

            mov eax, SND_FILENAME;; pszSound is a file name
             or eax, SND_NOSTOP; Play in a loop
        or eax, SND_ASYNC;; Play in the background
        mov esi, OFFSET file2
        invoke PlaySound, esi, 0, eax
    ret
     
    isntFood:
    ret

foodcheck ENDP

removefood PROC
cmp levelreached, 1
jg level2map
mov esi, OFFSET collisionarray
jmp continueProc
level2map :
    mov esi, OFFSET collisionarray2

        continueProc :

xor eax, eax
xor ebx, ebx
mov al, xPos
mov bl, yPos
dec bl
imul ebx, 60
    add eax, ebx
	;//mov esi, OFFSET collisionarray
        xor ebx, ebx
    mov bl, [esi+eax]
    cmp ebx, 0
    je wasFood
    jmp wasntFood

        wasFood:
        cmp levelreached, 1
            jg level2map2
           
            mov[collisionarray + eax], 2
            jmp continueProc2
           
            level2map2 :
                mov[collisionarray2 + eax], 2

            continueProc2 :
            ret

        wasntFood:
        ret

removefood ENDP






wallcheck PROC

            cmp levelreached, 1
            jg level2map
            mov esi , OFFSET collisionarray
                jmp continueProc
                level2map:
                mov esi, OFFSET collisionarray2

            continueProc: 

xor eax, eax
xor ebx, ebx

mov al, xPos
mov bl, yPos
dec bl
;//i = y * W + x (for given (x,y) where W  is rowlength = 60)
    ;//check ith index if it wall, then stop
    imul ebx, 60
    add eax, ebx
	;//mov esi, OFFSET collisionarray
        xor ebx, ebx
    mov bl, [esi+eax]
    cmp ebx, 1
        je wall
        jmp notwall


        wall:
        mov eax, 1
        jmp toRet

        notwall:
        mov eax, 0
        
         toRet  :
        ret

wallcheck ENDP


Ewallcheck PROC

cmp levelreached, 1
jg level2map
mov esi, OFFSET collisionarray
jmp continueProc
level2map :
        mov esi, OFFSET collisionarray2

            continueProc :

xor eax, eax
xor ebx, ebx

mov al, enemyXPos
mov bl, enemyYPos
dec bl
;//i = y * W + x (for given (x,y) where W  is rowlength = 60)
        ;//check ith index if it wall, then stop
        imul ebx, 60
            add eax, ebx
            ;// mov esi, OFFSET collisionarray
            xor ebx, ebx
            mov bl, [esi + eax]
            cmp ebx, 1
            je ewall
            jmp enotwall


            ewall :
        mov eax, 1
            jmp EtoRet

            enotwall :
        mov eax, 0

            EtoRet :
            ret



Ewallcheck ENDP

collisionCheck PROC

        xor eax, eax
        xor ebx, ebx
    mov al, xPos
    cmp al, enemyXPos
    jne notCollidingwithenemy
    mov al, yPos
    cmp al, enemyYPos
    jne notCollidingwithenemy
    ;// player is intersecting enemy :
    dec lives
    mov al, lives
    cmp al, 0
        je gameoverscr1
        ret
        gameoverscr1:
        call gameisover
    notCollidingwithenemy :

    ret
collisionCheck ENDP

collisionCheck2 PROC

        mov al, xPos
        cmp al, inkyXPos
        jne notCollidingwithinky
        mov al, yPos
        cmp al, inkyYPos
        jne notCollidingwithinky
        ;// player is intersecting enemy :
    dec lives
        mov al, lives
        cmp al, 0
        je gameoverscr2
        ret
        gameoverscr2 :
    call gameisover

        notCollidingwithinky :
		ret
collisionCheck2 ENDP


collisionCheck3 PROC

mov al, xPos
cmp al, clydeXPos
jne notCollidingwithclyde
mov al, yPos
cmp al, clydeYPos
jne notCollidingwithclyde
;// player is intersecting enemy :
        dec lives
            mov al, lives
            cmp al, 0
            je gameoverscr3
            ret
            gameoverscr3 :
        call gameisover
            notCollidingwithclyde:
        ret

collisionCheck3 ENDP

EnemyTrail PROC

cmp levelreached, 1
jg level2map
mov esi, OFFSET collisionarray
jmp continueProc
level2map :
    mov esi, OFFSET collisionarray2

        continueProc :

xor eax, eax
xor ebx, ebx
mov al, enemyXPos
mov bl, enemyYPos
dec bl
imul ebx, 60
    add eax, ebx
	;//mov esi, OFFSET collisionarray
        xor ebx, ebx
    mov bl, [esi+eax]
    cmp ebx, 2
    jb foodExisted
    je spaceExisted 
    jmp endtrailfunction

        foodExisted: 
        mov eax, lightGray; (black * 16)
        call SetTextColor
            xor eax, eax
            mov al, 249
            ret

        spaceExisted:
            xor eax, eax
            mov al, " "
            ret

        endtrailfunction:
            ret

EnemyTrail ENDP

endoflevel PROC
cmp score, 420 
jle not420
mov al, 1

not420:
            ret
endoflevel ENDP


endoflevel2 PROC
cmp score, 940
jle not940
mov al, 1
not940:
ret
endoflevel2 ENDP

gameisover PROC
    call Clrscr
            call clrscr
    mov dl, 0
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET gameOver
    mov eax, red; (black * 16)
    call SetTextColor
    call WriteString
            mov dl, 22
            mov dh, 19
            call Gotoxy
            mov edx, OFFSET username
            call writestring
            mov dl, 32
            mov dh, 19
            call Gotoxy
            mov ax, score
            call WriteDec
            mov edx, 1 ;//edx 1 means game is over
            mov dl, 100
            mov dh, 100
            call Gotoxy

            L1:
        call READCHAR
        cmp al, "x"
        jne L1
        mov edx, 10;//edx 10 means exit game
        ret
gameisover ENDP


teleportation PROC
;//if y = 16,x= 61, then y = 16 , x = 0
        xor edx, edx
        mov edx, 0
        cmp xPos, 60
        jne noTeleport
        cmp yPos, 16
        jne noTeleport        
    
            mov xPos, 0
            mov yPos, 16
            mov eax, SND_FILENAME;; pszSound is a file name
            or eax, SND_NOSTOP;; Play in a loop
            or eax, SND_ASYNC;; Play in the background
            mov esi, OFFSET file3
            invoke PlaySound, esi, 0, eax
            mov edx, 1 ;//edx 1 means teleportation happened
            ret   
    noTeleport: 
            cmp xPos, 255
            jne noTeleport2
            cmp yPos, 16
            jne noTeleport2
                mov xPos, 59
                mov yPos, 16
                mov eax, SND_FILENAME;; pszSound is a file name
                or eax, SND_NOSTOP;; Play in a loop
                or eax, SND_ASYNC;; Play in the background
                mov esi, OFFSET file3
                invoke PlaySound, esi, 0, eax

                noTeleport2:
            ret

teleportation ENDP



enemyTeleportation PROC
xor edx, edx
mov edx, 0
cmp enemyxPos, 60
jne noETeleport
cmp enemyyPos, 16
jne noETeleport

mov enemyxPos, 0
mov enemyyPos, 16

mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_NOSTOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi, OFFSET file3
invoke PlaySound, esi, 0, eax
mov edx, 1;//edx 1 means teleportation happened
        ret
            noETeleport :
            cmp enemyxPos, 255
            jne noETeleport2
            cmp enemyyPos, 16
            jne noETeleport2
            mov enemyxPos, 59
            mov enemyyPos, 16
                mov eax, SND_FILENAME;; pszSound is a file name
                or eax, SND_NOSTOP;; Play in a loop
                or eax, SND_ASYNC;; Play in the background
                mov esi, OFFSET file3
                invoke PlaySound, esi, 0, eax

            noETeleport2:
        ret
enemyTeleportation ENDP

END main






        ;/////////////////DEPRECATED ENEMY MOVEMENT;/////////////////////


        ;//////////////////









