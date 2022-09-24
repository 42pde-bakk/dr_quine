NAME = Sully

SRCS = $(NAME).s
OBJS = $(NAME).o

ASFLAGS = -f elf64
AS = nasm
LDFLAGS = -lc -m64 -no-pie
include ../../mk_settings/colours.mk
include ../../mk_settings/flags.mk

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@
	@printf "$(PINK)Done building $(NAME) $(RESET)\n"

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	/bin/rm -f $(OBJS)
	@/bin/rm -f *.o *~ *.gch

fclean: clean
	/bin/rm -f $(NAME) Sully_*

re: fclean all
