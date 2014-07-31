DESCRIPTION = "u-blox Benchmark Package Groups"
LICENSE = "MIT"

inherit packagegroup

PROVIDES = "${PACKAGES}"
PACKAGES = " \
    packagegroup-ublox-benchmark \
    "

RDEPENDS_packagegroup-ublox-benchmark = " \
    iperf \
    memtester \
    stress \
    "
