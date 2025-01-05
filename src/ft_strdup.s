; Function prototype in C:
; char        *ft_strdup(const char *s);
; - Input registers:
;   - rdi = [argv[0]] | Pointer to the source string (`s`).
; - Output:
;   - rax: Pointer to the newly allocated duplicate string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            global  ft_strdup

            extern  ft_strlen
            extern  malloc
            extern  ft_strcpy

ft_strdup:
            call	ft_strlen	; Call `ft_strlen` to get the length of the source string => rax = len of rdi
            add		rax, 1		; Add 1 to rax to account for the null terminator '\0'
            push	rdi			; Save the original `rdi` (source pointer) on the stack.
            mov		rdi, rax	; Move the source len size (rax) to `rdi` => parameter for `malloc`
            call	malloc		; Allocate rdi memory for the duplicate string. Pointer returned in `rax`.
            pop		r8			; Restore the original `rdi` (source pointer) into `r8` registry.
            mov		rdi, rax	; Move the allocated memory pointer to `rdi` (destination).
            mov		rsi, r8     ; Move the original source pointer to `rsi`.
            call	ft_strcpy  ; Call `ft_strcpy(rdi, rsi)` to copy the source string into the allocated memory.
            ret                 ; return rax, the pointer to ft_strcpy destination, aka the duplicated string.
