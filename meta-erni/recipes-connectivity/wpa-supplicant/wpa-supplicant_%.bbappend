FILESEXTRAPATHS:append := "${THISDIR}/files"

SRC_URI += " \
    file://wpa_supplicant.conf.custom \
"

SYSTEMD_AUTO_ENABLE = "enable"

do_install:append() {
    install -m 0755 ${WORKDIR}/wpa_supplicant.conf.custom ${D}${sysconfdir}/wpa_supplicant.conf
}