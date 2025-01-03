; Function prototype in C:
; int         ft_strcmp(const char *s1, const char *s2);
; - Input registers:
;   - rdi = [argv[0]] | Pointer to the first string (`s1`).
;   - rsi = [argv[1]] | Pointer to the second string (`s2`).
; - Output:
;   - rax: Negative, zero, or positive value depending on the lexicographical comparison.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            global  _ft_strcmp

_ft_strcmp:
            mov		al, BYTE [rdi]  ; al <- rdi[0] Load the current/first byte from s1 into al. al is a 1 BYTE register
            mov		bl, BYTE [rsi]	; bl <- rdi[0] Load the current/first byte from s1 into bl. bl is a 1 BYTE register
            cmp		al, 0			; Check if the end of s1 is reached. Compare al to a null terminator
            je		ft_exit			; If so, jump to ft_exit.
            cmp		bl, 0			; Check if the end of the second string s2 is reached.
            je		ft_exit         ; If so, jump to ft_exit.
            cmp		al, bl			; Compare the current characters of the two strings.
            jne		ft_exit			; If they are not equal, jump to ft_exit.
            inc		rdi				; Move to the next character in the first string s1
            inc		rsi				; Move to the next character in the second string s2
            jmp		_ft_strcmp	

ft_exit:
            movzx	rax, al			; movzx zero-extend `al` into `rax` for the return value.
            movzx	r8, bl          ; movzx zero-extend `bl` into `r8` for the second string's character.
            sub		rax, r8			; rax = rax - r8 ; Subtract the character values to calculate the result.
            ret                     ; return rax
	