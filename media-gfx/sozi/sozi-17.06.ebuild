# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils fdo-mime multilib 

DESCRIPTION="Sozi is a zooming presentation editor and player"
HOMEPAGE="https://sozi.baierouge.fr"
SRC_URI="
    x86?   ( https://github.com/senshu/Sozi/releases/download/${PV}/Sozi-${PV}.021848-linux-x64.tgz -> ${PN}-${PV}.tgz )
    amd64? ( https://github.com/senshu/Sozi/releases/download/${PV}/Sozi-${PV}.021848-linux-x64.tgz -> ${PN}-${PV}.tgz )
"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT=""

DEPEND=""
RDEPEND="media-libs/alsa-lib
    gnome-base/gconf
    x11-libs/gtk+:2
    x11-libs/libnotify
    x11-libs/libXtst
    dev-libs/nss
	app-misc/jq
	media-fonts/corefonts"

S="${WORKDIR}"

src_prepare() {
eapply_user
cd "${WORKDIR}"
mv Sozi-* ${PN}-${PV}
}

src_install() {
    cd "${WORKDIR}/${PN}-${PV}"
	exeinto /opt/${PN}
	doexe Sozi
	insinto /opt/${PN}
	doins -r * 
    dosym /opt/${PN}/Sozi /usr/bin/${PN}
	make_wrapper ${PN} ./Sozi /opt/${PN} /opt/bin
	insinto /usr/share/applications
	doins "${FILESDIR}"/${PN}.desktop
    insinto /usr/share/pixmaps
	doins "${FILESDIR}"/${PN}.png

}

pkg_postinst() {
    cd /opt/${PN}
    chmod +x icudtl.dat libffmpeg.so Sozi libnode.so
    fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
