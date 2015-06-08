FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://hostapd.conf \
    file://hostapd.init \
    "

inherit update-rc.d
INITSCRIPT_NAME = "hostapd"
INITSCRIPT_PARAMS = "start 20 . stop 20 0 1 2 3 4 5 6 ."

do_install_append() {
    install -d ${D}${sysconfdir}/init.d
    install --backup=none -m 755 ${WORKDIR}/hostapd.conf ${D}${sysconfdir}/hostapd.conf
    install --backup=none -m 755 ${WORKDIR}/hostapd.init ${D}${sysconfdir}/init.d/hostapd
}
