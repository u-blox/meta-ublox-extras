# Copyright (C) 2014 Johan Hovold <johan@hovoldconsulting.com>

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://hiawatha.conf \
    file://hiawatha.volatiles \
    "

pkg_postinst_${PN}() {
	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
		/etc/init.d/populate-volatile.sh update
	fi
}

do_install_append() {
    install -d ${D}${sysconfdir}/default/volatiles
    install -m 644 ${WORKDIR}/hiawatha.volatiles \
        ${D}${sysconfdir}/default/volatiles/99_hiawatha

    install -d ${D}${sysconfdir}/hiawatha
    install -m 644 ${WORKDIR}/hiawatha.conf ${D}${sysconfdir}/hiawatha

    rm ${D}/var/www/hiawatha/index.html

    # We run server as www-data (rather than OE default nobody)
    sed -i 's/nobody/www-data/g' ${D}${sysconfdir}/hiawatha/php-fcgi.conf
}

FILES_${PN} += "${sysconfdir}/default/volatiles/99_hiawatha"
