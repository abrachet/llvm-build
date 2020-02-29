
# Some servers don't allow many processes. OPTIMIZED_TABLEGEN is broken
# with Ninja and doesn't honor MAX_COMPILE_JOBS or -j N. ld.lld also
# creates too many threads in my experience. ld.gold gives me annoying
# warnings when building against asan, so I just use ld.bfd the default
# unless I am not limited in processes in which case I use lld.

limits=
if [ `ulimit -u` -lt 1000 ]; then
    limits="-DLLVM_PARALLEL_LINK_JOBS=4                     \
            -DLLVM_PARALLEL_COMPILE_JOBS=16"
else
    limits="-DLLVM_PARALLEL_LINK_JOBS=8                     \
            -DLLVM_OPTIMIZED_TABLEGEN=ON                    \
            -DLLVM_ENABLE_LLD=ON"
fi

other=
if [ `which ccache`]; then
    other="$other -DLLVM_CCACHE_BUILD=ON"
fi
