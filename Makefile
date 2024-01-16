SRC_DIR  = c_src
OBJ_DIR  = $(MIX_APP_PATH)/obj
PRIV_DIR = $(MIX_APP_PATH)/priv

NIF_SO = $(PRIV_DIR)/test_defer_load_nif.so

CFLAGS  += -O2 -Wall -Wextra -pedantic -fPIC -I$(SRC_DIR)
LDFLAGS += -shared

ERL_CFLAGS  ?= -I$(ERTS_INCLUDE_DIR) -I$(ERL_EI_INCLUDE_DIR)
ERL_LDFLAGS ?= -L$(ERL_EI_LIBDIR) -lei

SRC_C  = $(wildcard $(SRC_DIR)/*.c)
OBJ    = $(SRC_C:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

.PHONY: all
all: $(OBJ_DIR) $(PRIV_DIR) $(NIF_SO)

$(NIF_SO): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS) $(ERL_LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c Makefile
	$(CC) -o $@ -c $(CFLAGS) $(ERL_CFLAGS) $<

$(OBJ_DIR) $(PRIV_DIR):
	@mkdir -p $@

.PHONY: clean
clean:
	$(RM) $(NIF_SO) $(OBJ)
