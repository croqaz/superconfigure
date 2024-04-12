
PILLOW_DEPS := lib/readline lib/gdbm \
               lib/libexpat lib/freetype \
               lib/fribidi lib/libjpeg lib/libpng \
               lib/libwebp lib/libtiff \
               cosmo-repo/compress cosmo-repo/base

$(eval $(call SPECIFY_DEPS,python/cpy311-pillow,$(PILLOW_DEPS)))

o/python/cpy311-pillow/downloaded: \
    DL_COMMAND = rm -rf ./pillow && \
        git clone --quiet --depth=1 --branch=pillow https://github.com/croqaz/cpython pillow

o/python/cpy311-pillow/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pillow/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pillow/config-wrapper
o/python/cpy311-pillow/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pillow/config-wrapper

o/python/cpy311-pillow/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pillow/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pillow/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pillow/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pillow/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-pillow/fatten

pillow: o/python/cpy311-pillow/built.fat
.PHONY: pillow
