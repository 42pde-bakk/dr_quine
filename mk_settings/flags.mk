ifndef FLAGS_MK
	CFLAGS = -Wall -Werror -Wextra
	ifdef DEBUG
	 CFLAGS += -g3 -fsanitize=address
	endif
	ifdef BONUS
	 CFLAGS += -D BONUS=1
	endif
	ifdef LOGGING
	 CFLAGS += -D LOGGING=1
	endif
	SHELL := /bin/bash
	export SHELL
	export DEBUG
	ifdef SPEED
	 CFLAGS += -Ofast
	endif
endif
