#!/usr/bin/env bash
# vim: ft=sh tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set -euo pipefail
if ! nvim --version > /dev/null 2>&1;then
  echo >&2 "*** install/build neovim before building neovide please" ;
  exit 1 ;
fi
#if ! cargo --version > /dev/null 2>&1;then
#  echo >&2 "*** install rust toolchain before building neovide please" ;
#  exit 1 ;
#fi
#
# ──── DEPENDENCIES ──────────────────────────────────────────────────
#
    # gcc-multilib \
    # g++-multilib \
if command -- "$(which apt-get 2>/dev/null)" --version > /dev/null 2>&1 ; then
  sudo apt-get install -yq \
    ninja-build \
    clang \
    curl \
    gnupg \
    ca-certificates \
    git \
    cmake \
    libssl-dev \
    pkg-config \
    libfreetype6-dev \
    libasound2-dev \
    libexpat1-dev \
    libxcb-composite0-dev \
    libbz2-dev \
    libsndio-dev \
    freeglut3-dev \
    libxmu-dev \
    libxi-dev \
    libfontconfig1-dev ;
elif command -- "$(which pacman 2>/dev/null)" --version > /dev/null 2>&1 ; then
  depends=(
    "fontconfig"
    "freetype2"
    "libglvnd"
    "sndio"
  )
  sudo pacman -Sy --noconfirm --needed "${depends[@]}"
  # ─────────────────────────────────────────────────────────────────────
  makedepends=(
    "git"
    "rust"
    "gtk3"
    "cmake"
    "sdl2"
    "make"
  )
  sudo pacman -Sy --noconfirm --needed --asdeps "${makedepends[@]}"
else
  echo >&2 "*** your current distribution is not unsupported." 
  exit 1
fi
#
# ──── GETTING SOURCE CODE ────────────────────────────────────────────
#
url="https://github.com/Kethku/neovide"
build_dir="/usr/local/src/neovide"
sudo rm -rf "${build_dir}"
sudo git clone "${url}" "${build_dir}"
sudo chown "$(id -u):$(id -g)" "${build_dir}" -R ;
pushd "${build_dir}" > /dev/null 2>&1 ;
#
# ──── BUILD ──────────────────────────────────────────────────────────
#
sed -i 's/debug = true/opt-level = 3\ndebug = false/' "${PWD}/Cargo.toml"
sed -i 's/Icon=neovide/Icon=nvim/' "${PWD}/assets/neovide.desktop"
if [[ $(uname -m) != "aarch64" ]];then
  export CFLAGS="-fcommon -fPIE"
  export CFLAGS="${CFLAGS} -march=native -O2 -pipe -fno-plt -fexceptions"
  export CFLAGS="${CFLAGS} -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security"
  export CFLAGS="${CFLAGS} -fstack-clash-protection -fcf-protection"
  export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
  export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
  export RUSTFLAGS="-C opt-level=3 -C target-cpu=native"
fi
[ -r "/usr/bin/ninja" ] && export SKIA_NINJA_COMMAND="/usr/bin/ninja" ;
cargo build --jobs "$(nproc)" --release
#
# ──── INSTALL ────────────────────────────────────────────────────────
#
[ -r "${PWD}/LICENSE" ] \
  && sudo mkdir -p "/usr/share/licenses/neovide" \
  && sudo rm -f "/usr/share/licenses/neovide/LICENSE" \
  && sudo install -Dm644 "${PWD}/LICENSE" "/usr/share/licenses/neovide/LICENSE"
[ -r "${PWD}/target/release/neovide" ] \
  && sudo mkdir -p "/usr/local/bin" \
  && sudo rm -f "/usr/local/bin/neovide" \
  && sudo install -Dm755 "${PWD}/target/release/neovide" "/usr/local/bin/neovide"
[ -r "${PWD}/assets/neovide.desktop" ] \
  && sudo mkdir -p "/usr/share/applications" \
  && sudo rm -f "/usr/share/applications/neovide.desktop" \
  && sudo install \
    -Dm644 "${PWD}/assets/neovide.desktop" \
    "/usr/share/applications/neovide.desktop"
# ─────────────────────────────────────────────────────────────────────
popd > /dev/null 2>&1 ;
