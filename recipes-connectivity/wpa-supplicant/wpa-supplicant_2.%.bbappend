
do_configure_append () {
	cat <<EOF >> wpa_supplicant/.config
CONFIG_DRIVER_NL80211=y
CONFIG_CTRL_IFACE=y
CONFIG_WPS=y
CONFIG_WPS2=y
CONFIG_P2P=y
CONFIG_AP=y
CONFIG_IEEE80211N=y
EOF
}
