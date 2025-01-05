; Function prototype in C:
; ssize_t     ft_read(int fd, void *buf, size_t count);
; - Input registers:
;   - rdi = [argv[0]] | The file descriptor (fd).
;   - rsi = [argv[1]] | The address of the buffer (buf).
;   - rdx = [argv[2]] | The number of bytes to read (count).
; - Output:
;   - rax: Number of bytes successfully read, or -1 for an error.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            global  ft_read        ; The global instruction makes _ft_read globally accessible (for linking with C code)

ft_read:                           ; Function label (entry point).

            mov     rax, 0 	        ; Load the system call number for `read` into `rax`.
            syscall				    ; Executes the system call specified by rax (aka Call read)
            jc      ft_exit         ; Jump to error handling if the system call failed.
            ret					    ; Return rax (number of bytes read).

ft_exit:                            ; Error handling label
            mov     rax, -1         ; Load -1 into rax to indicate an error
            ret                     ; Return rax (-1) 