NAME = Sully

SRCS = $(NAME).s
OBJS = $(NAME).o

CCFLAGS = -f elf64 -g
AS = nasm
LDFLAGS = -lc -m64 -no-pie -g #-fsanitize=address
include ../../mk_settings/colours.mk
include ../../mk_settings/flags.mk

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@
	@printf "$(PINK)Done building $(NAME) $(RESET)\n"

%.o: %.s
	$(AS) $(CCFLAGS) $< -o $@

clean:
	/bin/rm -f $(OBJS)
	@/bin/rm -f *.o *~ *.gch

fclean: clean
	/bin/rm -f $(NAME) Sully_*

re:
	$(MAKE) fclean
	$(MAKE) all

debug: DEBUG=1
debug:
	$(MAKE) fclean
	$(MAKE) all
