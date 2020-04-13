# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 cmake-utils wxwidgets

WX_GTK_VER="3.0"
MY_PN="rtlsdr_pi"
EGIT_REPO_URI="https://github.com/seandepagnier/${MY_PN}.git"
if [[ ${PV} == "9999" ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86 ~arm"
	SRC_URI="https://github.com/seandepagnier/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="rtlsdr plugin for opencpn for AIS vhf and more on tv tuner usb dongle"
HOMEPAGE="https://github.com/seandepagnier/rtlsdr_pi"

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	sys-libs/zlib
	x11-libs/wxGTK:${WX_GTK_VER}
	>=sci-geosciences/opencpn-4.8.4
	sys-devel/gettext
	net-wireless/aisdecoder
	net-wireless/rtl-ais
"
DEPEND="${RDEPEND}"

IUSE="debug"

src_prepare() {
	need-wxwidgets unicode
	cmake-utils_src_prepare
}
src_configure() {
		CMAKE_BUILD_TYPE="Release"
		if use debug; then
			CMAKE_BUILD_TYPE="Debug"
		fi
		cmake-utils_src_configure
}
