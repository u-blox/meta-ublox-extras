FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://udhcpd.conf \
    "

do_install_append() {
    install -d ${D}/${sysconfdir}
    install -m 644 ${WORKDIR}/udhcpd.conf ${D}/${sysconfdir}
}

FILES_${PN}-udhcpd += " \
    ${sysconfdir}/udhcpd.conf \
    "

CONFFILES_${PN}-udhcpd += " \
    ${sysconfdir}/udhcpd.conf \
    "
