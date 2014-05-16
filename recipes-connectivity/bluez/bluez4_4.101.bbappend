# Copyright (C) 2014 Johan Hovold <johan@hovoldconsulting.com>

RRECOMMENDS_${PN} += "${PN}-hciattach-init"

INITSCRIPT_PACKAGES = "${PN} ${PN}-hciattach-init"
INITSCRIPT_NAME_${PN} = "bluetooth"
INITSCRIPT_PARAMS_${PN} = "defaults 20 15"
INITSCRIPT_NAME_${PN}-hciattach-init = "hciattach"
INITSCRIPT_PARAMS_${PN}-hciattach-init = "defaults 15 20"

inherit update-rc.d

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://bluetooth.init \
    file://hciattach.default \
    file://hciattach.init \
    "

do_install_append() {
    install -d ${D}/${sysconfdir}/default
    install -d ${D}/${sysconfdir}/init.d

    install -m 755 ${WORKDIR}/bluetooth.init ${D}/${sysconfdir}/init.d/bluetooth
    install -m 755 ${WORKDIR}/hciattach.init ${D}/${sysconfdir}/init.d/hciattach
    install -m 644 ${WORKDIR}/hciattach.default ${D}/${sysconfdir}/default/hciattach
}

PACKAGE_BEFORE_PN += "${PN}-hciattach-init"

FILES_${PN}-hciattach-init += " \
    ${sysconfdir}/default/hciattach \
    ${sysconfdir}/init.d/hciattach \
    "
