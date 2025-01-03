; Function prototype in C:
; size_t      ft_strlen(const char *s);
; - Input registers:
;   - rdi = [argv[0]] | Pointer to the string (`s`).
; - Output:
;   - rax: Length of the string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            global  _ft_strlen

_ft_strlen:
            mov		rax, 0		        ; Initialize rax to 0 (length counter).
            jmp		ft_loop             ; Jump to ft_loop label

ft_loop:
            cmp		BYTE [rdi + rax], 0 ; Check if the current character in src is the null '\0' terminator.
            je		ft_exit				; If so, jump to ft_exit label
            inc		rax					; Increment the length counter.
            jmp		ft_loop			    ; Repeat the process.

ft_exit:
	        ret							; Return the length stored in `rax`.