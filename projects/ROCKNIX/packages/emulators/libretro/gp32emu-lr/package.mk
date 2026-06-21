# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="gp32emu-lr"
PKG_VERSION="9ca3a72fac79eb57dd16ec21f3756e243e4a579d"
PKG_SHA256="f2265e5040a96103bac078e93c56d5b155091046b7486ec3f9c9811c3cfbdf56"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/gameblabla/gp32emu"
PKG_URL="https://github.com/gameblabla/gp32emu/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="GP32emu is a portable ARM920T GamePark GP32 emulator with libretro backend."
PKG_TOOLCHAIN="make"

make_target() {
  make -C ${PKG_BUILD} -f Makefile.libretro clean
  make -C ${PKG_BUILD} -f Makefile.libretro CFLAGS="${CFLAGS} -fPIC"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp ${PKG_BUILD}/gp32emu_libretro.so ${INSTALL}/usr/lib/libretro/
  cp ${PKG_BUILD}/gp32emu_libretro.info ${INSTALL}/usr/lib/libretro/
}
