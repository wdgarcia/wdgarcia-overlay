# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Program for watch analog TV$

EAPI=4
inherit eutils autotools

DESCRIPTION="High quality television application for use with video capture cards"
HOMEPAGE="https://linuxtv.org/"
SRC_URI="https://linuxtv.org/downloads/tvtime/${PN}-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86"
IUSE="xinerama"

RDEPEND="media-libs/alsa-lib
         media-libs/freetype
         media-libs/libpng
         x11-libs/libSM
         x11-libs/libXinerama
         dev-libs/libxml2
         x11-libs/libXtst
         x11-libs/libXv
         x11-libs/libXxf86vm
         x11-libs/libXt
         media-tv/v4l-utils"
         

DEPEND="${RDEPEND} sys-devel/gettext"
DOCS=( ChangeLog AUTHORS NEWS README )

src_prepare() {
    AT_M4DIR="m4" eautoreconf
}

src_configure() {
econf --with-included-getext

}

src_compile() {
emake 
}

src_install() {
	default

	dohtml docs/html/*
}

