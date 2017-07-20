# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Program for watch analog TV$

EAPI=4
inherit eutils autotools

DESCRIPTION="High quality television application for use with video capture cards"
HOMEPAGE="https://linuxtv.org/"
SRC_URI="https://linuxtv.org/downloads/tvtime/${PN}-${PV}.tar.gz"
LINGUAS="de en es"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86"
IUSE="nls xinerama"

RDEPEND="x11-libs/libSM
	x11-libs/libICE
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXv
	x11-libs/libXxf86vm
	xinerama? ( x11-libs/libXinerama )
	x11-libs/libXtst
	x11-libs/libXau
	x11-libs/libXdmcp
	>=media-libs/freetype-2
	>=sys-libs/zlib-1.1.4
	>=media-libs/libpng-1.2
	>=dev-libs/libxml2-2.5.11
	nls? ( virtual/libintl )"

DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

DOCS=( ChangeLog AUTHORS NEWS README )

src_prepare() {
    AT_M4DIR="m4" eautoreconf
}

src_configure() {
econf --prefix=/usr/ --mandir=/usr/share/man --localstatedir=/var --sysconfdir=/etc --disable-nls

}

src_compile() {
emake 
}

src_install() {
	default

	dohtml docs/html/*
}

