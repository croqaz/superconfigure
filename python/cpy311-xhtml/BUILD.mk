
PILLOW_DEPS := lib/ncurses lib/readline lib/gdbm \
               lib/libexpat lib/freetype \
               cosmo-repo/compress cosmo-repo/base \
               compress/brotli compress/xz

$(eval $(call SPECIFY_DEPS,python/cpy311-xhtml,$(PILLOW_DEPS)))

# must be in sync with:
# https://github.com/croqaz/cpython/blob/xhtml/Modules/Setup
o/python/cpy311-xhtml/downloaded: \
    DL_COMMAND = rm -rf ./xhtml && \
        git clone --depth=1 --branch=xhtml https://github.com/croqaz/cpython xhtml

o/python/cpy311-xhtml/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-xhtml/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-xhtml/config-wrapper
o/python/cpy311-xhtml/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-xhtml/config-wrapper

o/python/cpy311-xhtml/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-xhtml/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-xhtml/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-xhtml/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-xhtml/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-xhtml/fatten

xhtml: o/python/cpy311-xhtml/built.fat
.PHONY: xhtml
