; Function prototype in C:
; char        *ft_strcpy(char *dest, const char *src);
; - Input registers:
;   - rdi = [argv[0]] | Destination buffer (`dest`).
;   - rsi = [argv[1]] | Source string (`src`).
; - Output:
;   - rax: Pointer to the destination buffer (`dest`).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            global  ft_strcpy

ft_strcpy:
            mov		rax, 0				; Initialize rax to 0 (used as an index)
            jmp		ft_copy			    ; jump to ft_copy label

ft_copy:
            cmp		BYTE [rsi + rax], 0	; Check if the current character in src is '\0'
            je		ft_exit				; If rsi[rax] == '\0', jump to ft_exit
            mov		cl, [rsi + rax]		; cl = rsi[rax] | Load the current character from the source into `cl`
            mov 	[rdi + rax], cl		; rdi[rax] = cl | Copy the character from `cl` to the destination
            inc		rax					; Increment the index
            jmp		ft_copy			    ; Repeat the process

ft_exit:
            mov		cl, 0				; Set the null terminator '\0' into the `cl` register.
            mov		[rdi + rax], cl		; rdi[rax] = cl | Append the null terminator to the destination
            mov		rax, rdi			; Set `rax` to point to the destination buffer (return value) 
            ret                         ; Return rax