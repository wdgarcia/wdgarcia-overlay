# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="An Gentoo Plymouth theme Based of Ubuntu Plymouth Theme" 
LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=sys-boot/plymouth-0.9.2
        >=sys-kernel/genkernel-next-64"


S="${FILESDIR}"

src_install() {
insinto /usr/share/plymouth/themes
doins -r gentoo-logo

insinto /etc/plymouth/
doins -r plymouthd.conf
}

pkg_postinst() {
    elog "${PN} ${PV} installed successfully in your system"
}

