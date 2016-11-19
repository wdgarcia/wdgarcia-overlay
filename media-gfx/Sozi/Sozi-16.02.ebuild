# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils fdo-mime multilib

DESCRIPTION="Sozi is a zooming presentation editor and player"
HOMEPAGE="https://sozi.baierouge.fr"
SRC_URI="amd64?   ( https://github.com/senshu/Sozi/releases/download/16.02-fix344/${PN}-${PVR}.141048-linux64.tgz )"
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
	net-libs/nodejs
	media-fonts/corefonts"

S="${WORKDIR}"/${PN}-${PV}.141048-linux64

src_install() {
	
	exeinto /opt/${PN}
	doexe Sozi
	
	insinto /opt/${PN}
	doins -r icudtl.dat locales nw.pak libffmpegsumo.so 
    chmod +x icudtl.dat libffmpegsumo.so nw.pak Sozi
    
    dosym /$(get_libdir)/libudev.so.1 /opt/${PN}/libudev.so.0
	dosym /opt/${PN}/Sozi /usr/bin/${PN}
	make_wrapper ${PN} ./Sozi /opt/${PN} /opt/bin
	
	insinto /usr/share/applications
	doins "${FILESDIR}"/${PN}.desktop

	insinto /usr/share/pixmaps
	doins "${FILESDIR}"/${PN}.png

}

pkg_postinst() {

    fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
