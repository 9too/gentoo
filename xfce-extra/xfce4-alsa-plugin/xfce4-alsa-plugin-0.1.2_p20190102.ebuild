# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vala meson

DESCRIPTION="Simple ALSA volume control for xfce4-panel"
HOMEPAGE="https://github.com/equeim/xfce4-alsa-plugin"
EGIT_COMMIT="10159129e14a59d14b5761441aaaf7c2f41a3673"
SRC_URI="https://github.com/equeim/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${PN}-${EGIT_COMMIT}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

RDEPEND="
	media-libs/alsa-lib
	>=xfce-base/xfce4-panel-4.13
	x11-libs/gtk+:3[introspection]
"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
"

S=${WORKDIR}/${PN}-${EGIT_COMMIT}

src_prepare() {
	vala_src_prepare
	eapply_user
}

src_configure() {
	local emesonargs=(
		-Dgtk3=true
	)
	meson_src_configure
}