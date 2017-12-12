# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python3_5 )
EGIT_REPO_URI="https://github.com/ubuntu-mate/mate-tweak.git"

#PYTHON_COMPAT=( python{2_7,3_{3,5}} )

inherit autotools distutils-r1 versionator git-r3
DESCRIPTION="Tweak tool for MATE"
HOMEPAGE="https://github.com/ubuntu-mate/mate-tweak"
#SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/mate-tweak_3.5.10.orig.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""



RDEPEND="
<x11-libs/libnotify-0.7.7
mate-base/mate-applets
x11-libs/gdk-pixbuf
dev-python/configobj[${PYTHON_USEDEP}]
dev-python/pygobject[${PYTHON_USEDEP}]
dev-python/psutil[${PYTHON_USEDEP}]
dev-python/setproctitle[${PYTHON_USEDEP}]
dev-python/python-distutils-extra[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

python_configure() {
setup.py
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	elog "${PN} ${PV} installed successfully in your system"
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
