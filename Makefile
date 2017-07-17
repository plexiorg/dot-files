SRC_DIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
DEST_DIR=$(HOME)/
FILES := .bashrc .gitconfig .vimrc

phonies := clean install


dest_FILES := $(FILES:%=$(DEST_DIR)%)

.PHONY: $(phonies)

all: $(phonies)

$(dest_FILES):
	-ln -s $(patsubst $(DEST_DIR).%, $(SRC_DIR).%, $@) $@

install: $(dest_FILES)

clean:
	-rm -rf $(dest_FILES)
