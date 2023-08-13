global obscure_pin

section .data
; ==========================
; Your data goes here
  ;pin db "3647", 0
  counter db 0

section .bss
  obscured resb 100
  pin resb 100
; ==========================

; void obscure_pin(char* pin)
; Obscures a 4-digit ASCII PIN in place.
; Assumes pin is in rdi.
section .text
obscure_pin:
  push rbp
  mov rbp, rsp
; Do not modify anything above this line unless you know what you are doing
; ==========================
; Your code goes here
  ; load PIN digits
   ;;pretend the pin is already in register
  mov ebx, 3 ;;counter variable
  xor eax, eax
  mov [pin], rdi
  mov esi, pin
;;this loop obscures the pin

iterate :
  movzx ecx, byte [esi] ;store first character of string
  cmp ecx, 0 ;if end of sting
  je done 
  sub ecx, 48
  xor ecx, 0xF
  add ecx, 48
  mov [obscured + ebx], ecx ;;this stores the 
  mov eax, obscured
  dec ebx
  inc esi
  jmp iterate
  ; obscure digits
  ; convert back to ASCII and store in reverse order
done:
  ;mov eax, 4
  ;mov ebx, 1
  ;mov ecx, obscured
  ;mov edx, 4
  ;int 0x80
  ;mov eax, 1
  ;int 0x80
; ==========================
; Do not modify anything below this line unless you know what you are doing

  leave
  ret