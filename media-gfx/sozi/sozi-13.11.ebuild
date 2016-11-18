# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils fdo-mime multilib

DESCRIPTION="Sozi is a zooming presentation editor and player"
HOMEPAGE="http://http://sozi.baierouge.fr/"
SRC_URI="x86?   ( https://github.com/senshu/Sozi/releases/download/${PVR}/${PN}-release-${PVR}-30213629.zip )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="splitdebug strip"

DEPEND="app-arch/unzip
        >=media-gfx/inkscape-0.48"

S="${WORKDIR}" 

src_unpack () {
unpack ${A}
cd "${S}"
}

src_install() {
       
        dodir /usr/share/inkscape/extensions/
        cp -R "${S}/" "${D}/" || die 
        doexe -R sozi sozi_extras_link.inx sozi_extras_link.py sozi_extras_media.inx sozi_extras_media.py sozi_extras_upgrade.inx sozi_extras_upgrade.py sozi.inx sozi.py
        }

pkg_postinst() {
	fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
