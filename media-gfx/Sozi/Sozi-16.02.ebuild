# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils fdo-mime multilib

DESCRIPTION="Sozi is a zooming presentation editor and player"
HOMEPAGE="https://sozi.baierouge.fr"
SRC_URI="x86? ( https://github.com/senshu/Sozi/releases/download/16.02-fix344/${PN}-${PVR}.141048-linux32.tgz )
amd64?   ( https://github.com/senshu/Sozi/releases/download/16.02-fix344/${PN}-${PVR}.141048-linux64.tgz )"
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

S="${WORKDIR}"

src_install() {
	
	exeinto /opt/${PN}
	doexe Sozi

	insinto /opt/${PN}
	doins -r icudtl.dat locales nw.pak libffmpegsumo.so Sozi
    
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
