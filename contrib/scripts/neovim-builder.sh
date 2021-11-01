#!/usr/bin/env bash
# vim: ft=sh tabstop=2 shiftwidth=2 softtabstop=2 expandtab

# https://gist.github.com/ecosse3/ab58a8577d8c69dccdf03304b720e1c8
set -euo pipefail
#
# ──── INITIAL SETUP ──────────────────────────────────────────────────
#
if "$(which apt-get 2>/dev/null)" -h > /dev/null 2>&1 ; then
  echo >&2 "*** removing neovim package installed through apt." 
  sudo "$(which apt-get 2>/dev/null)" update -qq
  sudo "$(which apt-get 2>/dev/null)" remove --purge -y neovim >/dev/null 2>&1  || true
  sudo "$(which apt-get 2>/dev/null)" autoremove --purge -y >/dev/null 2>&1  || true
  echo >&2 "*** installing build dependencies." 
  sudo "$(which apt-get 2>/dev/null)" install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
  sudo "$(which apt-get 2>/dev/null)" install -y xclip xsel
fi
if command -- "$(which pacman 2>/dev/null)" --version > /dev/null 2>&1 ; then
  echo >&2 "*** removing neovim package installed through pacman." 
  sudo "$(which pacman 2>/dev/null)" -Rcns --noconfirm neovim-nightly-bin >/dev/null 2>&1  || true
  echo >&2 "*** installing build dependencies." 
  sudo "$(which pacman 2>/dev/null)" -Sy --needed --noconfirm base-devel cmake unzip ninja tree-sitter curl doxygen
  sudo "$(which pacman 2>/dev/null)" -Sy --needed --noconfirm xclip xsel
fi
if command -- "$(which apk 2>/dev/null)" --version > /dev/null 2>&1 ; then
  echo >&2 "*** removing neovim package installed through apk." 
  sudo "$(which apk 2>/dev/null)" del neovim >/dev/null 2>&1  || true
  sudo "$(which apk 2>/dev/null)" add --virtual .neovim-build-deps --no-cache build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
  sudo "$(which apk 2>/dev/null)" add --virtual .ctags-build-deps --no-cache automake autoconf build-base git pkgconf
  sudo "$(which apk 2>/dev/null)" add --no-cache xclip xsel
fi
#
# ──── NEOVIM ────────────────────────────────────────────────────────
#
echo >&2 "*** building neovim..." 
[ ! -d "/usr/local/src/neovim" ] && sudo git clone https://github.com/neovim/neovim.git "/usr/local/src/neovim"
sudo chown "$(id -u):$(id -g)" "/usr/local/src/neovim" -R
pushd "/usr/local/src/neovim" > /dev/null 2>&1
git reset --hard
git fetch --all --tags
git checkout "tags/stable" || true
git pull || true
# export CMAKE_BUILD_TYPE="RelWithDebInfo"
export CMAKE_BUILD_TYPE="Release"
export CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local"
make -j"$(nproc)" 
unset CMAKE_BUILD_TYPE ;
unset CMAKE_EXTRA_FLAGS ;
sudo -E make -j"$(nproc)" install
popd > /dev/null 2>&1
#
# ──── CTAGS ──────────────────────────────────────────────────────────
#
echo >&2 "*** building universal ctags..." 
[ ! -d "/usr/local/src/ctags" ] && sudo git clone https://github.com/universal-ctags/ctags.git "/usr/local/src/ctags"
sudo chown "$(id -u):$(id -g)" "/usr/local/src/ctags" -R
pushd "/usr/local/src/ctags" > /dev/null 2>&1
git pull
bash ./autogen.sh
bash ./configure
make -j"$(nproc)"
sudo -E make -j"$(nproc)" install
popd > /dev/null 2>&1
#
# ──── CLEAN UP ──────────────────────────────────────────────────────
#
echo >&2 "*** cleaning up..." 
echo >&2 "*** removing build dependencies..." 
if command -- "$(which apk 2>/dev/null)" --version > /dev/null 2>&1 ; then
  sudo "$(which apk 2>/dev/null)" del --no-cache --purge .neovim-build-deps
  sudo "$(which apk 2>/dev/null)" del --no-cache --purge .ctags-build-deps
fi
echo >&2 "*** removing source codes..." 
# sudo rm -rf /usr/local/src/neovim
# sudo rm -rf /usr/local/src/ctags
