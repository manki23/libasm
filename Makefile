# Name of the final library
NAME = libasm.a

# Source files in the src/ directory
SRCS =	src/ft_strlen.s \
		src/ft_strcpy.s \
		src/ft_strcmp.s \
		src/ft_write.s \
		src/ft_read.s \
		src/ft_strdup.s

# Object files will be placed in an obj/ directory
OBJS = $(patsubst src/%.s, obj/%.o, $(SRCS))

HEADER = inc/libasm.h

# Compiler and assembler options
NASM = nasm
NASMFLAGS = -f macho64
CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iinc -arch x86_64

# Rule to build the library
all: $(NAME)

# Rule to create the static library
# $@ -> The target name (libasm.a)
# $^ -> All prerequisites (list of all .o files)
$(NAME): $(OBJS)
	@echo "Creating library $(NAME) with objects: $(OBJS)"
	ar rcs $@ $^

# Rule to create object files in the obj/ directory
# $< -> The first prerequisite (the .s file being compiled)
obj/%.o: src/%.s $(HEADER) | obj
	$(NASM) $(NASMFLAGS) $< -o $@

# Rule to create the obj/ directory if it doesn't exist
# This is a special "order-only prerequisite" to ensure the directory exists
obj:
	mkdir -p obj

# Rule to build the main test program
# $@ -> The target name (main)
# $^ -> All prerequisites (main.o and libasm.a)
main: $(NAME) main.o
	$(CC) $(CFLAGS) -o $@ main.o -L. -lasm

# Rule to compile main.c into main.o
main.o: main.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to clean object files
clean:
	rm -f $(OBJS) main.o

# Rule to clean all generated files
fclean: clean
	rm -f $(NAME) main
	rm -rf obj

# Rule to recompile everything from scratch
re: fclean all
