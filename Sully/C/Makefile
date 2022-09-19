NAME = Sully

OBJ_DIR = ./obj
SRCS = $(NAME).c
OBJS = $(NAME).o

include ../../mk_settings/colours.mk
include ../../mk_settings/flags.mk

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDE) $(OBJS) $(LIBS) -o $@
	@printf "$(PINK)Done building $(NAME) $(RESET)\n"

%.o: %.c
	@mkdir -p "$(@D)"
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

clean:
	/bin/rm -f $(OBJS)
	@/bin/rm -f *.o *~ *.gch

fclean: clean
	/bin/rm -f $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all

debug: DEBUG=1
debug:
	$(MAKE) fclean
	$(MAKE) all
