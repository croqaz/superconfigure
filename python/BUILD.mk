
include python/cpy311-datasette/BUILD.mk
include python/cpy311-pypack1/BUILD.mk
include python/cpy311-pypack2/BUILD.mk
include python/cpy311-pypack3/BUILD.mk
include python/cpy311-scrapscript/BUILD.mk

all-python: datasette pypack1 pypack2
.PHONY: all-python
