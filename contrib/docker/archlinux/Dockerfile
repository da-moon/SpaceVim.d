# syntax = docker/dockerfile-upstream:master-labs
# vim: ft=dockerfile syntax=dockerfile softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
FROM archlinux:base
WORKDIR /tmp/
# 
#  ──── INITIAL SETUP ─────────────────────────────────────────────────
# 
USER root
RUN \
  pacman-key --init \
  && pacman-key --populate archlinux \
  && pacman -Syyu --noconfirm \
  && pacman -S --noconfirm bash
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# 
#  ──── CONFIGURING PACMAN ───────────────────────────────────────────
# 
USER root
RUN \
sed -i \
  -e "/ParallelDownloads/d" \
  -e  '/\[options\]/a ParallelDownloads = 16' \
  "/etc/pacman.conf" \
&& sed -i \
  -e "/Color/d" \
  -e "/ILoveCandy/d" \
  -e '/\[options\]/a Color' \
  -e '/\[options\]/a ILoveCandy' \
  "/etc/pacman.conf" ;
# 
#  ──── FINDING FASTEST SOURCES ───────────────────────────────────────
# 
USER root
RUN \
pacman -S --noconfirm reflector \
&& reflector \
  --verbose \
  -p https \
  --latest 5 \
  --sort rate \
  --save "/etc/pacman.d/mirrorlist"
#
#  ──── SUDO ─────────────────────────────────────────────────────────
#
USER root
RUN \
pacman -Sy --noconfirm sudo \
&& ! getent group sudo > /dev/null && groupadd sudo \
&& sed -i \
  -e '/%wheel.*NOPASSWD:\s*ALL/d' \
  -e '/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/d' \
  "/etc/sudoers" \
&& ( \
echo "%wheel ALL=(ALL) ALL" ; \
echo "%wheel ALL=(ALL) NOPASSWD: ALL" ; \
) | tee -a "/etc/sudoers" > /dev/null ;
#
#  ──── USER CREATION ─────────────────────────────────────────────────
#
USER root
ENV USER="devel"
ENV UID="1000"
ENV HOME="/home/${USER}"
RUN \
pacman -Sy --noconfirm perl \
&& useradd \
  --no-log-init \
  --create-home \
  --home-dir "${HOME}" \
  --gid "${UID}" \
  --uid "${UID}" \
  --groups sudo \
  --shell "/bin/bash" \
  --password \
  $(perl \
    -e 'print crypt($ARGV[0], "password")' \
      "${USER}_${UID}" 2>/dev/null) \
"${USER}"  \
&& usermod -aG wheel,root "${USER}" ;
#
#  ──── CORE PACKAGES ─────────────────────────────────────────────────
#
USER root
ARG PACKAGES="\
  base-devel \
  git \
  wget \
  curl \
  ripgrep \ 
  fd \
  sd \
  just \
  python \
  python2 \
  unzip \
  fzf \
  jq \
  "
RUN \
IFS=' ' read -a PACKAGES <<< "$PACKAGES" ; \
pacman -Sy --noconfirm --needed "${PACKAGES[@]}"
#
#  ──── NEOVIM ───────────────────────────────────────────────────────
#
USER "$USER"
ENV PATH="${PATH}:${HOME}/.local/bin"
RUN \
  git clone "https://aur.archlinux.org/neovim-git.git" "/tmp/neovim-git" \
  && pushd "/tmp/neovim-git" > /dev/null 2>&1 ; \
  for i in {1..5}; do makepkg --noconfirm -sicr && break || sleep 15 ; done ; \
  popd > /dev/null 2>&1 ; \
  rm -r "/tmp/neovim-git"
# 
#  ──── CLEAN UP ─────────────────────────────────────────────────────
# 
USER "root"
RUN \
  pacman -Rcns --noconfirm systemd \
  && pacman -Qdtq | xargs -r pacman -Rs - || true \
  && pacman -Scc --noconfirm \
  && rm -rf "/var/cache/pacman/pkg/"* \
  && rm -rf "/tmp/"*
#
#  ──── WORKDIR ───────────────────────────────────────────────────────
#
USER "$USER"
# required by packer when installing luarocks modules
ENV SHELL "/bin/bash"
ENV TERM xterm
ARG WORKDIR="/workspace"
ENV WORKDIR $WORKDIR
VOLUME $WORKDIR
WORKDIR $WORKDIR
RUN ln -sf "${WORKDIR}" "${HOME}/.SpaceVim.d"
ENTRYPOINT [ "/bin/bash" ]
