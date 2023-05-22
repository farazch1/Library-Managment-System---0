
; ***************************************
; ****** LIBRARY MANAGEMENT SYSTEM ******
; ***************************************

; ***************************************
; ************ SUBMITTED BY *************
; ***** MUHAMMAD AHMAD 	2021-CE-43 ******
; ***** HUSSNAIN ALI 	2021-CE-60 ******
; ***** MIAN FARAZ   	2021-CE-44 ******
; ***** ALI ABDULLAH    2021-CE-40 ******
; ***************************************
INCLUDE IRVINE32.inc

.DATA

;***********************************************
; ****** Strings of messages to display ********
;***********************************************

msg1	 BYTE 0AH
		 BYTE	"	--------------------------------------------", 0dh, 0ah
		 BYTE	"	--  WELCOME TO LIBRARY MANAGEMENT SYSTEM  --", 0dh, 0ah
		 BYTE	"	--------------------------------------------", 0dh, 0ah, 0ah
		 BYTE	"	1-> Register a Member", 0dh, 0ah
		 BYTE	"	2-> View Members", 0dh, 0ah
		 BYTE	"	3-> View Members From File", 0dh, 0ah
		 BYTE	"	4-> Add Book", 0dh, 0ah
		 BYTE	"	5-> View Books", 0dh, 0ah
		 BYTE	"	6-> View Books From Files", 0dh, 0ah
		 BYTE	"	7-> Exit Program", 0dh, 0ah
		 BYTE	"	Choose Your Option : ", 0
REG_MSG	 BYTE "	Enter Member's Name to register: ",0
VIEW_MEMBERS_MSG BYTE 0Ah,"	Viewing Registered Members: ",0AH, 0DH, 0
ADD_MSG			 BYTE "	Enter Book Name & Author Name to Add: ", 0dh, 0ah,
			 "	Separated By Comma ",0dh,0ah,
			 "	Note: ",0dh,0ah,
			 "	Please write two fullstops spaced apart after writing info and before pressing enter: ",0
VIEW_BOOKS_MSG BYTE 0Ah, "	Viewing Books in Library: ",  0dh, 0ah, 0
EXIT_MSG	   BYTE 0AH,
				    "	----------------- ",0dh, 0ah,
				    "	Exiting Program...",0dh, 0ah,
					"	------------------", 0
					
					
; variables to maniulate Books & Members

bool		   DWORD ?
MEMBERS_FILE   BYTE "C:\Users\faraz\Desktop\Library-Management-System-master\Library-Management-System-master\MEMBERS.txt",0
BOOKS_FILE     BYTE "C:\Users\faraz\Desktop\Library-Management-System-master\Library-Management-System-master\BOOKS.txt",0
filehandle     DWORD ?
filehandle_B     DWORD ?
Book_name_size   DWORD ?
m_sizee     DWORD ?

SPACEMAKER DWORD 0ah
MEMS DWORD 1

B_MEMS DWORD 1

BUFFER_SIZE = 5000
buffer_mem   BYTE buffer_size DUP (?)
buffer_book  BYTE buffer_size DUP (?)
bytesRead dword 1 dup(0)
REGISTER	 DWORD 1
VIEW_MEMBERS DWORD 2
VIEW_MF		 DWORD 3
ADD_BOOK	 DWORD 4
VIEW_BOOKS	 DWORD 5
VIEW_BF		 DWORD 6
EXITP		 DWORD 7	
MEMBER_SIZE = 20
MEMBER1 DB MEMBER_SIZE DUP (?)
MEMBER2 DB MEMBER_SIZE DUP (?)
MEMBER3 DB MEMBER_SIZE DUP (?)
MEMBER4 DB MEMBER_SIZE DUP (?)
MEMBER5 DB MEMBER_SIZE DUP (?)
MEMBER6 DB MEMBER_SIZE DUP (?)
NUM_MEMBERS DWORD 0
MEMBERS DD MEMBER1, MEMBER2, MEMBER3, MEMBER4, MEMBER5, MEMBER6, 0AH, 0DH, 0

BOOK_SIZE = 30
BOOK1 DB BOOK_SIZE DUP (?)
BOOK2 DB BOOK_SIZE DUP (?)
BOOK3 DB BOOK_SIZE DUP (?)
BOOK4 DB BOOK_SIZE DUP (?)
BOOK5 DB BOOK_SIZE DUP (?)
BOOK6 DB BOOK_SIZE DUP (?)
NUM_BOOKS DWORD 0
BOOKS DD BOOK1, BOOK2, BOOK3, BOOK4, BOOK5, BOOK6, 0AH, 0DH, 0


; **********************************************
; *************** Code Section *****************
; **********************************************

.CODE
MSG_DISPLAY proto, var: PTR DWORD
STRING_INPUT proto, var1: PTR DWORD
main PROC
	START:

	INVOKE MSG_DISPLAY,addr MSG1
	CALL READINT	; input for options

	CMP EAX, REGISTER
	JE REG_M		; jump to Register Member section
	CMP EAX, VIEW_MEMBERS
	JE VIEW_M		; jump to View Members section
	CMP EAX, VIEW_MF
	JE VIEW_MFILE		; jump to Add Book section
	CMP EAX, ADD_BOOK
	JE ADD_B		; jump to View Books section
	CMP EAX, VIEW_BOOKS
	JE VIEW_B		; calling function to display message
	CMP EAX, VIEW_BF
	JE VIEW_BFILE		; taking input in 2D array
		JMP EXIT_MENU


;--------------------------------------
;--------------VIEW MEMBERS------------
;--------------------------------------
	VIEW_M:
		INVOKE MSG_DISPLAY, ADDR VIEW_MEMBERS_MSG
	MOV ECX, NUM_MEMBERS
	cmp ECX, 0
	JE START
	MOV EBX, 0
OUTPUT:
	MOV ESI, OFFSET MEMBERS
	MOV EAX, MEMBER_SIZE
	MUL EBX
	ADD ESI, Eax
	MOV EDX, ESI
	CALL WRITESTRING
	INC EBX
	CALL CRLF
LOOP OUTPUT
		JMP START

; VIEW MEMBERS FROM FILE
VIEW_MFILE:
	INVOKE CreateFile,
	    ADDR MEMBERS_FILE, ; ptr to filename
	    GENERIC_READ, ; mode = Can read
	    DO_NOT_SHARE, ; share mode
	    NULL, ; ptr to security attributes
	    OPEN_ALWAYS, ; open an existing file
	    FILE_ATTRIBUTE_NORMAL, ; normal file attribute
	    0 ; not used
	mov filehandle, eax ; Copy handle to variable
	
	invoke ReadFile,
	    filehandle, ; file handle
	    addr BUFFER_MEM, ; where to read
	    BUFFER_SIZE, ; num bytes to read
	    addr bytesRead, ; bytes actually read
	    0
	invoke CloseHandle,
	filehandle
	mov edx, offset BUFFER_MEM ; Write String
	call WriteString
	JMP START

;----------------------------------------
;------------REGISTER MEMBERS------------
;----------------------------------------
	REG_M:
		INVOKE MSG_DISPLAY, ADDR REG_MSG          ;INVOKE STRING_INPUT, ADDR INPUT_STRING

	MOV ESI, OFFSET MEMBERS
	MOV EAX, MEMBER_SIZE
	MUL NUM_MEMBERS
	ADD ESI, EAX
	MOV EDX, ESI
	MOV ECX, MEMBER_SIZE
	CALL READSTRING
	MOV m_sizee,EAX
	INC NUM_MEMBERS
	cmp MEMS,1
	JA aldr

	INVOKE CreateFile, ADDR MEMBERS_FILE, FILE_APPEND_DATA, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
	MOV filehandle, EAX
    aldr:
	   mov EDI, OFFSET SPACEMAKER
	   mov  eax,fileHandle
       mov  edx,EDI
       mov  ecx,1
       call WriteToFile
       mov  eax,fileHandle
       mov  edx,ESI
       mov  ecx,m_sizee
       call WriteToFile

	   inc MEMS
	

	JMP START


;------------------------------------
;-------------VIEW BOOKS-------------
;------------------------------------
	VIEW_B:
	
	INVOKE MSG_DISPLAY, ADDR VIEW_BOOKS_MSG
	MOV ECX, NUM_BOOKS
	cmp ECX, 0
	JE START
	MOV EBX, 0
OUTPUTB:
	MOV ESI, OFFSET BOOKS
	MOV EAX, BOOK_SIZE
	MUL EBX
	ADD ESI, EAX
	MOV EDX, ESI
	CALL WRITESTRING
	INC EBX
	CALL CRLF	
LOOP OUTPUTB
		
JMP START
; VIEW BOOKS FROM FILE
VIEW_BFILE:
	INVOKE CreateFile,
	ADDR BOOKS_FILE, ; ptr to filename
	GENERIC_READ, ; mode = Can read
	DO_NOT_SHARE, ; share mode
	NULL, ; ptr to security attributes
	OPEN_ALWAYS, ; open an existing file
	FILE_ATTRIBUTE_NORMAL, ; normal file attribute
	0 ; not used
	mov filehandle_B, eax ; Copy handle to variable
	
	invoke ReadFile,
	filehandle_B, ; file handle
	addr BUFFER_BOOK, ; where to read
	BUFFER_SIZE, ; num bytes to read
	addr bytesRead, ; bytes actually read
	0
	
	invoke CloseHandle,
	filehandle_B
	mov edx, offset BUFFER_BOOK ; Write String
	call WriteString
	JMP START
;----------------------------------
;--------------ADD BOOKS-----------
;----------------------------------	
	ADD_B:
	INVOKE MSG_DISPLAY, ADDR ADD_MSG
	MOV ESI, OFFSET BOOKS
	MOV EAX, BOOK_SIZE
	MUL NUM_BOOKS
	ADD ESI, EAX
	MOV EDX, ESI
	MOV ECX, BOOK_SIZE
	CALL READSTRING
	mov Book_name_size,EAX 
	INC NUM_BOOKS
	cmp B_MEMS,1
	JA aldrq

	INVOKE CreateFile, ADDR BOOKS_FILE, FILE_APPEND_DATA, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
	MOV filehandle_B, EAX
    aldrq:
	   mov EDI, OFFSET SPACEMAKER
	   mov  eax,filehandle_B
       mov  edx,EDI
       mov  ecx,1
       call WriteToFile
       mov  eax,filehandle_B
       mov  edx,ESI
       mov  ecx,Book_name_size
       call WriteToFile

	   inc B_MEMS

		
	JMP START
;-------------------------------------------
;----------------EXIT MENU------------------
;-------------------------------------------
	EXIT_MENU:
		INVOKE MSG_DISPLAY, ADDR EXIT_MSG
	
	invoke ExitProcess,0
main endp

;-------------------------------------------
;--------FUNCTION TO DISPLAY A STRING-------
;-------------------------------------------
MSG_DISPLAY PROC USES EDX, VAR: ptr dword
	MOV EDX, VAR
	CALL WRITESTRING
	RET
	MSG_DISPLAY ENDP

STRING_INPUT PROC USES EDX ECX, var: ptr dword
		
	MOV EDX, VAR
	MOV ECX, 5000
	CALL READSTRING
	RET
	STRING_INPUT ENDP

end main
