DESCRIPTION = "USB Gadget init script"
AUTHOR = "Johan Hovold <johan@hovoldconsulting.com>"
LICENSE = "GPLv2+"
SECTION = "kernel/userland"

LIC_FILES_CHKSUM = " \
    file://usbg.init;beginline=7;endline=18;md5=c87dd5c7a19d07e37c079d34e38ed832 \
    "

SRC_URI = " \
    file://usbg.init \
    file://usbg.default \
    "

S = "${WORKDIR}"

INITSCRIPT_NAME = "usbg"
INITSCRIPT_PARAMS = "start 39 S ."

inherit update-rc.d

do_install_append () {
    install -d ${D}/${sysconfdir}/default
    install -d ${D}/${sysconfdir}/init.d

    install -m 755 ${WORKDIR}/usbg.init ${D}/${sysconfdir}/init.d/usbg
    install -m 644 ${WORKDIR}/usbg.default ${D}/${sysconfdir}/default/usbg
}

RRECOMMENDS_${PN} = " \
    kernel-module-usb-f-acm \
    kernel-module-usb-f-ncm \
    kernel-module-usb-f-mass-storage \
    "
