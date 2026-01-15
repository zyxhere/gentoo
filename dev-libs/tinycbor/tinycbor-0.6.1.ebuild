# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Concise Binary Object Representation (CBOR) Library"
HOMEPAGE="https://intel.github.io/tinycbor/current/index.html"
SRC_URI="
	https://github.com/intel/tinycbor/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz
"
LICENSE="MIT"
SLOT=0
KEYWORDS="~amd64"

src_compile() {
	emake -f "${S}"/Makefile.configure OUT="${S}"/.config configure
	emake CFLAGS="${CFLAGS}" prefix="${EPREFIX}"/usr BUILD_SHARED=1
}

src_install() {
	emake DESTDIR="${ED}" prefix="${EPREFIX}"/usr BUILD_STATIC=0 install

	if use elibc_glibc; then
		# use /lib64
		mv "${ED}"/usr/lib "${ED}"/usr/lib64
		sed -i 's|/usr/lib|/usr/lib64|' "${ED}"/usr/lib64/pkgconfig/tinycbor.pc
	fi
}
