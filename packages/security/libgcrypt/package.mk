################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="libgcrypt"
PKG_VERSION="1.5.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnupg.org/"
PKG_URL="ftp://ftp.gnupg.org/gcrypt/libgcrypt/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS="libgpg-error"
PKG_BUILD_DEPENDS_TARGET="toolchain libgpg-error"
PKG_PRIORITY="optional"
PKG_SECTION="security"
PKG_SHORTDESC="libgcrypt: General purpose cryptographic library"
PKG_LONGDESC="Libgcrypt is a general purpose cryptographic library based on the code from GnuPG. It provides functions for all cryptographic building blocks: symmetric ciphers, hash algorithms, MACs, public key algorithms, large integer functions, random numbers and a lot of supporting functions."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-asm --with-gnu-ld"

post_makeinstall_target() {
  sed -e "s:\(['= ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" -i src/libgcrypt-config
  cp src/libgcrypt-config $ROOT/$TOOLCHAIN/bin

  rm -rf $INSTALL/usr/bin
}
