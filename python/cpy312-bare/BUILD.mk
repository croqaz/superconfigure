
PYBARE_DEPS := lib/ncurses lib/readline lib/gdbm \
               lib/libexpat lib/freetype lib/libuuid \
               cosmo-repo/compress cosmo-repo/base \
               lib/certs compress/xz

$(eval $(call SPECIFY_DEPS,python/cpy312-bare,$(PYBARE_DEPS)))

# must be in sync with:
# https://github.com/croqaz/cpython/blob/3.12/Modules/Setup
o/python/cpy312-bare/downloaded: \
    DL_COMMAND = rm -rf ./pybare && \
        git clone --depth=1 --branch=3.12 https://github.com/croqaz/cpython pybare

o/python/cpy312-bare/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy312-bare/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy312-bare/config-wrapper
o/python/cpy312-bare/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy312-bare/config-wrapper

o/python/cpy312-bare/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy312-bare/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy312-bare/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy312-bare/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy312-bare/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy312-bare/fatten

pybare: o/python/cpy312-bare/built.fat
.PHONY: pybare
