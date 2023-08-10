; This makes your function available to other files
global greeting

section .data
; ==========================
; Your data goes here
  output db "Welcome to the bank of <<Redacted>>", 0xa
  length equ $ - output

; ==========================

section .text
; void greeting()
; This function prints a greeting to the screen
greeting:
  push rbp
  mov rbp, rsp
; Do not modify anything above this line unless you know what you are doing
; ==========================
; Your code goes here
  mov eax, 4
  mov ebx, 1
  mov ecx, output
  mov edx, length
  int 0x80

  mov eax, 1
  xor ebx, ebx
  int 0x80
; ==========================
; Do not modify anything below this line unless you know what you are doing
  leave
  ret