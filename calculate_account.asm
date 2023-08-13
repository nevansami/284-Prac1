global calculate_account

section .data
; ==========================
; Your data goes here

; ==========================

section .text
; Inputs:
;   rdi - pin
; Outputs:
;   eax - balance
calculate_account:
  push rbp
  mov rbp, rsp

; Do not modify anything above this line unless you know what you are doing
; ==========================
; Your code goes here
  xor rax, rax
  mov edx, 6468 ;pretend as if this is the pin from user
  mov eax, edx ; load 32bit integer pin
  add rax, 10000 ; adding 10000 to pin for acc number

  ;mov eax, 1
  ;int 0x80
  ;mov rax, rax ; moving acc number to rax
; ==========================
; Do not modify anything below this line unless you know what you are doing

  leave
  ret