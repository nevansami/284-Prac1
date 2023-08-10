; This makes your function available to other files
global calculate_balance

section .data
; ==========================
; Your data goes here
section .bss
  account resb 10
; ==========================

section .text
; Calculate balance based on account number and pin
; Inputs:
;   rdi - account number
;   rsi - pin
; Outputs:
;   eax - balance
calculate_balance:
  push rbp
  mov rbp, rsp
; Do not modify anything above this line unless you know what you are doing
; ==========================
; Your code goes here
  mov rdi, 16767
  mov rsi, 6767 ;pretend as if the two registers have the passed in values. this is to be changed later
  mov [account], rdi
  mov rax, [account] ; store a copy of rdi in rax
  add rdi, rsi ;A = A + P
  imul rdi, rsi ;(A + P)*P
  xor rax, rsi ; A = A xor P
  and rax, rdi ; rax stores final result of computation


  mov eax, 1 ; This can be deleted, it just keeps function from causing a runtime error until completed
  int 0x80
; ==========================
; Do not modify anything below this line unless you know what you are doing
  leave
  ret