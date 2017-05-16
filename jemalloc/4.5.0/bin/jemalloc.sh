#!/bin/sh

prefix=/usr/local/Cellar/jemalloc/4.5.0
exec_prefix=/usr/local/Cellar/jemalloc/4.5.0
libdir=${exec_prefix}/lib

DYLD_INSERT_LIBRARIES=${libdir}/libjemalloc.2.dylib
export DYLD_INSERT_LIBRARIES
exec "$@"
