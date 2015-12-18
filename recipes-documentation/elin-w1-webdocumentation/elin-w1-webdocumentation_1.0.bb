# Copyright (C) 2015 u-blox AG
DESCRIPTION = "u-blox ELIN-W1 web documentation"
HOMEPAGE = "http://www.u-blox.com"
LICENSE = "MIT"
SECTION = "docs/misc"

LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2a6a0650f0e4693d25fd0d5667ed1569"

SRCREV = "f332916a2fb12faa24f6093abeabf029f8431abf"
SRC_URI = "git://${UBLOX_GIT}/elin-w1-web-documentation.git;protocol=${UBLOX_GIT_PROTOCOL};branch=fido"

PR = "r1+gitr${SRCPV}"

DEPENDS = "hiawatha"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}/var/www/hiawatha
    install -d ${D}/var/www/hiawatha/css
    install -d ${D}/var/www/hiawatha/files
    install -d ${D}/var/www/hiawatha/images
    install -d ${D}/var/www/hiawatha/js
    if [ -f ${D}/var/www/hiawatha/index.html ]; then
        rm ${D}/var/www/hiawatha/index.html
    fi
    cp -R ${WORKDIR}/git/* ${D}/var/www/hiawatha
}

FILES_${PN} += "\
	/var/www/hiawatha \
	/var/www/hiawatha/css \
	/var/www/hiawatha/files \
	/var/www/hiawatha/images \
	/var/www/hiawatha/js"
