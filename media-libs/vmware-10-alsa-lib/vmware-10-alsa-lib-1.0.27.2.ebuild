# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils multilib

DESCRIPTION="An older ALSA Library, which doesn't crash vmware products, stashed away in a harmless nonstandard location"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI="mirror://alsaproject/lib/${P#vmware-10-}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${P#vmware-10-}"

src_prepare() {
	find . -name Makefile.am -exec sed -i -e '/CFLAGS/s:-g -O2::' {} + || die
	epatch_user
	eautoreconf
}

src_configure() {
	local myconf
	use elibc_uclibc && myconf+=" --without-versioned"

	econf \
		--disable-maintainer-mode \
		--enable-shared \
		--disable-resmgr \
		--enable-rawmidi \
		--enable-seq \
		--enable-aload \
		$(use_with debug) \
		--disable-alisp \
		--disable-python \
		${myconf}
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	einfo "removing everything but the library file"
	find "${ED}" -name "libasound.so.2.0.0" -o -delete 2>/dev/null || /bin/true
	location="/opt/vmware-libasound"
	einfo "moving the library file to a random nonstandard place"
	mkdir -p "${ED}${location}" || die
	mv -v "${ED}usr/$(get_libdir)/libasound.so.2.0.0" "${ED}${location}" || die
	chmod a-x "${ED}${location}/libasound.so.2.0.0" || die
	rmdir -v "${ED}usr/$(get_libdir)" || die
	rmdir -v "${ED}usr" || die
}
