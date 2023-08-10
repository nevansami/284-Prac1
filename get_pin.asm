; This makes your function available to other files
; This makes your function available to other files
global get_pin

section .data
; ==========================
; Your data goes here

  prompt db "Enter 4-digit PIN: ", 0
  promptLength equ $ - prompt

section .bss
  inputLength resb 1
  input resb 1
; ==========================

section .text
; uint32_t get_pin()
; Reads a 4-digit PIN from stdin and converts it to an integer.
; The PIN returned must be a valid 4-digit (32-bit) integer.
get_pin:
  push rbp
  mov rbp, rsp
; Do not modify anything above this line unless you know what you are doing
; ==========================
; Your code goes here

; Print the message that asks for a pin
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, prompt ;buffer
  mov edx, promptLength ;buffer length
  int 0x80
; Read the pin from stdin and store it in a buffer
  mov eax, 3
  mov ebx, 0
  mov ecx, input
  mov edx, 100
  int 0x80
;print the value in 

; Convert the pin to an integer
; 
  mov ecx, input
  sub ecx, '0'
  mov eax, ecx
  int 0x80
; Store the integer in eax
  ;mov eax, 0 ; This can be deleted, it just keeps function from causing a runtime error until completed

  mov eax, 1
  xor ebx, ebx
  int 0x80
; ==========================
; Do not modify anything below this line unless you know what you are doing
  leave
  ret