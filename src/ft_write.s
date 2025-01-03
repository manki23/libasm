; Function prototype in C:
; ssize_t     ft_write(int fd, const void *buf, size_t count);
; - Input registers:
;   - rdi = [argv[0]] | File descriptor (`fd`).
;   - rsi = [argv[1]] | Pointer to the buffer (`buf`).
;   - rdx = [argv[2]] | Number of bytes to write (`count`).
; - Output:
;   - rax: Number of bytes written, or -1 on error.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            global  _ft_write

_ft_write:
            mov     rax, 0x2000004	; Load the system call number for `write` into `rax`.
            syscall				    ; Execute the system call write(rdi, rsi, rdx) => rax
            jc      ft_exit         ; If CF (Carry Flag) is set (error), jump to error handling.
            ret					    ; Return the number of bytes written in `rax` (len written)

ft_exit:
            mov     rax, -1         ; Set `rax` to -1 to indicate an error.
            ret                     ; Return rax.
