<<<<<<< HEAD
; This makes your function available to other files
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
  mov eax, 0 ; This can be deleted, it just keeps function from causing a runtime error until completed
; ==========================
; Do not modify anything below this line unless you know what you are doing

  leave
=======
; This makes your function available to other files
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
  mov eax, dword [rdi] ; load 32bit integer pin
  add eax, 10000 ; adding 10000 to pin for acc number
  mov rax, rax ; moving acc number to rax
; ==========================
; Do not modify anything below this line unless you know what you are doing

  leave
>>>>>>> 495cf75a87c267e283baee0e0c3d770e15a9f29b
  ret