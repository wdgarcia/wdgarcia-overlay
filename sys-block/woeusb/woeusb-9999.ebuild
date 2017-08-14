# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

EGIT_REPO_URI="git://github.com/slacka/WoeUSB.git"

inherit git-r3 autotools

DESCRIPTION="A Linux program to create Windows USB stick installer from a real Windows"
HOMEPAGE="https://github.com/slacka/WoeUSB"

LICENSE="gpl"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
<=x11-libs/wxGTK-3.0.0
sys-boot/grub

"
DEPEND="${RDEPEND}"

src_configure () {
eautoreconf --force --install || die 
econf 
}

src_compile () {
emake || die
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}


