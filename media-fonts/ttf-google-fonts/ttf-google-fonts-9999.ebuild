# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit 

DESCRIPTION="TrueType fonts from the Google Fonts project"
HOMEPAGE="https://fonts.google.com/"
SRC_URI="https://github.com/google/fonts/archive/master.zip"

LICENSE="various"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
app-arch/unzip
	"
RDEPEND="${DEPEND}
	"

S="${WORKDIR}/fonts-master"

src_install () {
insinto /usr/share/fonts/TTF
doins -r apache ofl ufl
}

pkg_postinst() {
    elog "${PN} ${PV} installed successfully in your system"
}
