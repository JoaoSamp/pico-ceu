CEU_DIR     = $(error set absolute path to "<ceu>" repository)
CEU_SDL_DIR = $(error set absolute path to "<ceu-sdl>" repository)

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include -DCEU_SRC=$(CEU_SRC)"    \
	          --pre-input=main.ceu                                          \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass            \
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c --env-output=/tmp/storm.c    \
	    --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx" \
	         --cc-output=/tmp/$$(basename $(CEU_SRC) .ceu)
	cd $(dir $(CEU_SRC)) && /tmp/$$(basename $(CEU_SRC) .ceu)
