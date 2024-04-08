
o/compress/xz/downloaded: \
    DL_COMMAND = rm -rf ./xz && \
        git clone --quiet --depth=1 --branch v5.6.1 https://git.tukaani.org/xz.git

o/compress/xz/patched: PATCH_COMMAND = $(DUMMYLINK0)

XZ_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --enable-shared=no --enable-static=yes\
    --disable-nls --disable-rpath\
    --without-pic --with-gnu-ld\
    --enable-sandbox=no --disable-arm64-crc32\
    --disable-doc --disable-scripts\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call AUTOTOOLS_BUILD,compress/xz,$(XZ_CONFIG_ARGS),$(XZ_CONFIG_ARGS)))

o/compress/xz/setup: o/compress/xz/patched
	cd $(BASELOC)/o/compress/xz/xz* && ./autogen.sh --no-po4a --no-doxygen
	touch $@

o/compress/xz/configured.x86_64: o/compress/xz/setup
o/compress/xz/configured.aarch64: o/compress/xz/setup

o/compress/xz/built.fat: BINS = xz
