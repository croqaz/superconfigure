
PYPACK3_DEPS := lib/ncurses lib/readline lib/gdbm \
                lib/openssl lib/libexpat lib/libuuid \
                lib/certs cosmo-repo/compress cosmo-repo/base \
                compress/brotli compress/lz4

$(eval $(call SPECIFY_DEPS,python/cpy311-pypack3,$(PYPACK3_DEPS)))

o/python/cpy311-pypack3/downloaded: \
    DL_COMMAND = rm -rf ./pypack3 && \
        git clone --quiet --depth=1 --branch=3.11 https://github.com/croqaz/cpython pypack3

o/python/cpy311-pypack3/patched: \
    PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack3/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pypack3/config-wrapper
o/python/cpy311-pypack3/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pypack3/config-wrapper

o/python/cpy311-pypack3/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pypack3/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack3/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pypack3/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack3/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-pypack3/fatten

pypack3: o/python/cpy311-pypack3/built.fat
.PHONY: pypack3
