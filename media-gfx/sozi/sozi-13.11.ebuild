# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils fdo-mime multilib

DESCRIPTION="Sozi is a zooming presentation editor and player"
HOMEPAGE="http://http://sozi.baierouge.fr/"
SRC_URI="x86?   ( https://github.com/wdgarcia/wdgarcia-overlay/tree/master/media-gfx/sozi/sozi-13.11 )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=media-gfx/inkscape-0.48"

S="${WORKDIR}" 

src_install() {
       
        dodir /usr/share/inkscape/extensions
        insinto /usr/share/inkscape/extensions
        doins "${FILESDIR}"/usr/share/inkscape/extensions
        doexe -r sozi sozi_extras_link.inx sozi_extras_link.py sozi_extras_media.inx sozi_extras_media.py sozi_extras_upgrade.inx sozi_extras_upgrade.py sozi.inx sozi.py
        }

pkg_postinst() {
	fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
