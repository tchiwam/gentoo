# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils toolchain-funcs

DESCRIPTION="A simple single frequency AIS decoder"
HOMEPAGE="http://www.aishub.net/ais-decoder"

KEYWORDS="~arm ~amd64 ~x86"
SRC_URI="http://www.aishub.net/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="net-wireless/rtl-sdr
		virtual/libusb:1"
DEPEND="${RDEPEND}"
src_install() {
	dobin "${BUILD_DIR}/aisdecoder"
}
