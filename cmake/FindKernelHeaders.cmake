# See for details:
# https://github.com/Maik93/kernel-module-template

# Option 1. Find the kernel release locally (if you're running directly on a Raspi)
#execute_process(
#        COMMAND uname -r
#        OUTPUT_VARIABLE KERNEL_RELEASE
#        OUTPUT_STRIP_TRAILING_WHITESPACE
#)
#find_path(KERNELHEADERS_DIR
#        include/linux/user.h
#        PATHS /usr/lib/modules/${KERNEL_RELEASE}/build
#        )
#message(STATUS "Kernel release: ${KERNEL_RELEASE}")

# Option B. Find the headers in the submodule
find_path(KERNELHEADERS_DIR
        include/linux/user.h
        PATHS linux-headers-rpi
        )

message(STATUS "Kernel headers: ${KERNELHEADERS_DIR}")

if (KERNELHEADERS_DIR)
    set(KERNELHEADERS_INCLUDE_DIRS
            ${KERNELHEADERS_DIR}/include
            ${KERNELHEADERS_DIR}/arch/arm64/include
            CACHE PATH "Kernel headers include dirs"
            )
    set(KERNELHEADERS_FOUND 1 CACHE STRING "Set to 1 if kernel headers were found")
else (KERNELHEADERS_DIR)
    set(KERNELHEADERS_FOUND 0 CACHE STRING "Set to 1 if kernel headers were found")
endif (KERNELHEADERS_DIR)

mark_as_advanced(KERNELHEADERS_FOUND)
