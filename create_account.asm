; This tells the function that these exist outside of this file
extern greeting
extern get_pin
extern obscure_pin
extern calculate_balance
extern calculate_account

; This makes your function available to other files
global create_account

section .data
; ==========================
; Your data goes here
  acc_ptr dq 0
  pin_ptr dq 0
  bal_ptr dq 0
  acc_num_val dd 0
  pin_val dd 0
; ==========================

section .text
; void create_account(char *account_number, char *obscured_pin, char *balance)
; 
; Inputs:
;   rdi - account number
;   rsi - pin
;   rdx - balance
; 
; README:
; A lot has been given to start you off. You should be able to complete this without fully understanding how
; the functions work. I recommend using the foundation provided, however, you are free to change it as you see fit.
create_account:
  push rbp
  mov rbp, rsp
  sub rsp, 32

  mov qword [acc_ptr], rdi
  mov qword [pin_ptr], rsi
  mov qword [bal_ptr], rdx

  ; Greet the user (Diplomacy)
  call greeting

  ; Get the pin as a 32 bit integer
  call get_pin ; Call get_pin function
  mov [pin_val], eax  ; save pin

  ; Calculate the account number
  mov edi, eax
  call calculate_account
  mov [acc_num_val], eax  ; save account number

  ; Calculate the balance
  mov edi, eax  ; set account number as the first argument to calculate balance
  mov esi, [pin_val]  ; set pin as the second argument to calculate balance
  call calculate_balance

  ; Convert the balance to ascii and store it in the balance pointer

    mov rsi, rdx ; balance = rsi
    mov rdi, [bal_ptr] ; bal pointer = rdi
    call int_to_ascii

  ; Convert the pin to ascii and store it in the pin pointer
    mov rsi, [pin_val] ; pin = rsi
    mov rdi, [pin_ptr] ; pin pointer = rdi
    call int_to_ascii

  ; Convert the account number to ascii and store it in the account number pointer
    mov rsi, [acc_num_val] ; acc_num_val = rsi
    mov rdi, [pin_ptr] ; pin pointer = rdi
    call int_to_ascii

  ; Output account message
    mov rdi, acc_msg
    call print_string

  ; Output account number
    mov rsi, [acc_ptr]
    call print_string

  ; Output balance message
    mov rdi bal_msg
    call print_string

  ; Output balance
  mov rsi, [bal_ptr]
  call print_string

  ; Obsfucate the pin
  mov rdi, [pin_ptr]
  call obscure_pin

  ; Output pin message
  mov rdi, pin_msg
  call print_string

  ; Output obscured pin
  mov rsi, [pin_ptr]
  call print_string

  leave
  ret

; Integer to ASCII
; rsi: pointer to ASCII string, rdi: pointer to store the result
int_to_ascii:
  xor rcx, rcx         ; Clear the accumulator (rcx)
  xor rax, rax         ; Clear rax to store the result
.loop:
  movzx rdx, byte [rsi + rcx] ; Load the current ASCII character
  sub rdx, 48           ; Convert ASCII to numerical value
  imul rax, rax, 10    ; Multiply the result by 10
  add rax, rdx          ; Add the current digit to the result
  inc rcx               ; Move to the next character
  cmp byte [rsi + rcx], 0 ; Check if end of string
  jnz .loop             ; If not, repeat the loop
  mov [rdi], rax        ; Store the result in rdi
  ret

; Print null-terminated string pointed by rdi
print_string:
  xor rax, rax          ; Clear rax
.print_loop:
  mov al, byte [rdi]    ; Load the current character
  test al, al           ; Test if it's the null terminator
  jz .print_done         ; If yes, exit the loop
  mov rax, 1            ; sys_write syscall number
  mov rdi, 1            ; File descriptor (stdout)
  mov rsi, rdi          ; Load the current character to rsi
  mov rdx, 1            ; Number of bytes to write
  syscall               ; Make the syscall
  inc rdi               ; Move to the next character
  jmp .print_loop        ; Repeat the loop
.print_done:
  ret