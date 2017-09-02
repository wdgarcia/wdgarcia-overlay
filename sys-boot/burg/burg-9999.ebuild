# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils autotools

DESCRIPTION="Brand-new Universal loader from Grub"
HOMEPAGE="https://code.launchpad.net/burg"
SRC_URI="https://launchpad.net/~n-muench/+archive/ubuntu/burg/+files/burg_1.98+20100623.orig.tar.gz"
LICENSE="GPL-3"
SLOT="2"
KEYWORDS"~x86 ~amd64"
IUSE="custom-cflags debug truetype multislot static"
GRUB_ALL_PLATFORMS=( coreboot efi-32 efi-64 emu ieee1275 loongson multiboot qemu qemu-mips pc uboot xen xen-32 )
IUSE+=" ${GRUB_ALL_PLATFORMS[@]/#/grub_platforms_}"

REQUIRED_USE="
	grub_platforms_qemu? ( fonts )
"
