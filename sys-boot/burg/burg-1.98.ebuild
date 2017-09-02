# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils mount-boot flag-o-matic toolchain-funcs autotools

DESCRIPTION="Brand-new Universal loader from Grub"
HOMEPAGE="https://code.launchpad.net/burg"
SRC_URI="https://launchpad.net/~n-muench/+archive/ubuntu/burg/+files/burg_1.98+20100623.orig.tar.gz"
LICENSE="GPL-3"
SLOT="2"
#KEYWORDS"~x86 ~amd64"

IUSE="binfonts custom-cflags debug truetype multislot static"

RDEPEND="
>=sys-devel/gcc-4.1.3
sys-devel/make
>=sys-devel/bison-2.3.0
>=sys-devel/gettext-0.17
>=sys-devel/binutils-2.9.2"

DEPEND="${RDEPEND}
dev-lang/ruby"

PROVIDE="virtual/bootloader"

S="${WORKDIR}"

src_prepare () {
	eapply_user
	cd ${S}
 	mv ${PN}-${PV}+* ${PN}-${PV}
	cd ${S}/${PN}-${PV}
	./autogen.sh
	econf || die "failed econf in prepare"
}

src_compile () {
	cd ${S}/${PN}-${PV}	
	emake
	emake install
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
	elog "for use burg, first you must run burg-install /dev/sdx and burg-mkconfig -o /boot/burg/burg.cfg"
}

