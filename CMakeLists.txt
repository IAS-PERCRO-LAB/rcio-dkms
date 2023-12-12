cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

project("RCIO DKMS module for Navio2" VERSION 0.1.0 LANGUAGES C)
set(CMAKE_C_STANDARD 90)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Find kernel headers
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
find_package(KernelHeaders REQUIRED)


# find MODULE_LICENSE("GPL"), MODULE_AUTHOR() etc.
add_definitions(-D__KERNEL__ -DMODULE)

# this is needed in order for CLion IDE to provide syntax highlights
# (independent from the actual kernel object that is built)
add_executable(dummy
        # add all *.h and *.c files here that CLion should cover
        src/rcio_core.c
        src/rcio_gpio.c
        src/rcio_pwm.c
        src/rcio_rcin.c
        src/rcio_safety.c
        src/rcio_spi.c
        src/rcio_status.c
)

# CLion IDE will find symbols from <linux/*>
target_include_directories("dummy" PRIVATE ${KERNELHEADERS_INCLUDE_DIRS})
