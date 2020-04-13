# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 cmake-utils wxwidgets

WX_GTK_VER="3.0"
MY_PN="s63_pi"
EGIT_REPO_URI="https://github.com/bdbcat/${MY_PN}.git"
if [[ ${PV} == "9999" ]] ; then
	KEYWORDS=""
else
	if [[ ${PV} == "1.6.0" ]] ; then
		EGIT_COMMIT="e3fab8b9f91cb12459fc7b9321b5a645f6f5b06a"
		KEYWORDS="~arm ~amd64 ~x86"
	else
		die "Git HASH is not set for this version, check the ebuild"
	fi
fi

DESCRIPTION="S63 Charts Plugin for OpenCPN"
HOMEPAGE="https://github.com/bdbcat/${MY_PN}"

LICENSE="GPL-2+"
SLOT="0"
IUSE="debug"

RDEPEND="
	sys-libs/zlib
	x11-libs/wxGTK:${WX_GTK_VER}
	>=sci-geosciences/opencpn-4.8.0
	sys-devel/gettext
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/gentoo.patch"
)

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
