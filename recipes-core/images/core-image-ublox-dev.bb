DESCRIPTION = "u-blox Development Image"
LICENSE = "MIT"

IMAGE_FEATURES = "package-management ssh-server-openssh"
IMAGE_FEATURES += "tools-debug"
IMAGE_FEATURES += "debug-tweaks"

BASE_INSTALL = " \
    busybox-udhcpd \
    hiawatha \
    i2c-tools \
    mtd-utils \
    mtd-utils-ubifs \
    "

EXTRA_INSTALL = " \
    bash \
    less \
    lrzsz \
    minicom \
    nano \
    rsync \
    "

# Add package groups core-boot and base explicitly rather than through
# ${CORE_IMAGE_BASE_INSTALL} to avoid pulling in packagegroup-base-extended and
# it's derived dependencies.
IMAGE_INSTALL = " \
    packagegroup-core-boot \
    packagegroup-base \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    ${BASE_INSTALL} \
    ${EXTRA_INSTALL} \
    "

inherit core-image
