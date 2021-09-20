#!/usr/bin/env bash
# vim: ft=sh tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set -xeuo pipefail

#
# ─── CLEAN UPS ──────────────────────────────────────────────────────────────────
#

if command -- $(which pip3) --version > /dev/null 2>&1 ; then
  echo >&2 "*** ensuring all existing neovim related python packages are removed."
  sudo $(which python3) -m pip uninstall -yq neovim pynvim msgpack greenlet >/dev/null 2>&1  || true
  $(which python3) -m pip uninstall -yq neovim pynvim msgpack greenlet >/dev/null 2>&1  || true
fi
if command -- $(which pacman) --version > /dev/null 2>&1 ; then
  pacman -Qi python-pynvim > /dev/null 2>&1 && sudo pacman -Rcns --noconfirm python-pynvim
  pacman -Qi python-pip > /dev/null 2>&1 && sudo pacman -Rcns --noconfirm python-pip
  pacman -Qi python2-pip > /dev/null 2>&1 && sudo pacman -Rcns --noconfirm python2-pip
fi
if command -- $(which apt-get) --version > /dev/null 2>&1 ; then
  [ -n "$((dpkg-query -W --showformat='${Status}\n' python3-neovim 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get remove --purge -yqq python3-neovim
  [ -n "$((dpkg-query -W --showformat='${Status}\n' python3-pip 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get remove --purge -yqq python3-pip
  [ -n "$((dpkg-query -W --showformat='${Status}\n' python-pip 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get remove --purge -yqq python-pip
fi
if command -- $(which yarn) --version > /dev/null 2>&1 ; then
  sudo $(which yarn) global remove neovim  >/dev/null 2>&1  || true
fi
if (command -v perl && command -v cpanm) >/dev/null 2>&1; then
  sudo cpanm -S -f -q --uninstall Neovim::Ext  > /dev/null 2>&1 || true
  cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
  cpanm -f -q --uninstall Neovim::Ext > /dev/null 2>&1 || true
fi
echo >&2 "*** cleaning up neovim leftover directories."
sudo /bin/rm -rf \
    ~/.SpaceVim \
    ~/.vim* \
    ~/.config/coc \
    ~/.config/*vim* \
    ~/.cache/*vim* \
    ~/.cache/SpaceVim \
    ~/.cache/neosnippet \
    ~/.local/share/*vim*
#
# ─── PROVIDER INSTALLATION ──────────────────────────────────────────────────────
#
if command -- $(which pacman) --version > /dev/null 2>&1 ; then
  ! pacman -Qi cpanminus > /dev/null 2>&1 && sudo pacman -Sy --noconfirm cpanminus
fi
if command -- $(which apt-get) --version > /dev/null 2>&1 ; then
    [ -z "$((dpkg-query -W --showformat='${Status}\n' cpanminus 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install cpanminus -yqq
fi
if command -- $(which pacman) --version > /dev/null 2>&1 ; then
  ! pacman -Qi gawk > /dev/null 2>&1 && sudo pacman -Sy --noconfirm gawk
fi
if command -- $(which apt-get) --version > /dev/null 2>&1 ; then
  [ -z "$((dpkg-query -W --showformat='${Status}\n' gawk 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install gawk -yqq
fi

! command -- $(which pip3) --version > /dev/null 2>&1 && (curl -fsSl https://bootstrap.pypa.io/get-pip.py | sudo $(which python3))
if ! command -- $(which pip) --version > /dev/null 2>&1 ; then
  "$(which python2)" --version > /dev/null 2>&1 && curl -fsSl https://bootstrap.pypa.io/pip/$($(which python2) --version 2>&1 | gawk 'BEGIN{FS=OFS="."}{gsub("[^[:digit:].]*","");print $1,$2}')/get-pip.py | sudo $(which python2)
fi
! command -- $(which npm) --version > /dev/null 2>&1 && (curl -fsSL install-node.vercel.app | sudo bash -s -- --yes --verbose --prefix=/usr/local)
if ! command -- $(which yarn) --version > /dev/null 2>&1; then
  command -- $(which pacman) --version > /dev/null 2>&1 && sudo pacman -S --noconfirm yarn
  if command -- $(which apt-get) --version > /dev/null  2>&1; then
    curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
    sudo apt-get -qq update && sudo apt-get -yqq install yarn
  fi
fi

$(which python3) -m pip install --user -U pynvim
$(which python2) -m pip install --user -U pynvim
sudo $(which npm) -g install neovim
### yes | sudo perl -MCPAN -e 'upgrade'
# sudo cpanm -n -S -f -q Neovim::Ext
#
# ─── SPACEVIM INITIAL SETUP ─────────────────────────────────────────────────────
#
echo >&2 "*** installing SpaceVim."
curl -sLf https://spacevim.org/install.sh | bash
sed -i.bak 's/call dein#add/"call dein#add/g' "$HOME/.SpaceVim/autoload/SpaceVim/plugins.vim"
mkdir -p "$HOME/.local/share/nvim/shada"
# [ NOTE ] => https://herringtondarkholme.github.io/2016/02/26/dein/
nvim --headless \
 -c ":echon \"\\n\\n######\\tInstalling core plugins ...\\t#####\\n\\n\"" \
 -c "call dein#direct_install('neoclide/coc.nvim', { 'merged': 0,'rev': 'release'})" \
 -c "call dein#direct_install('deoplete-plugins/deoplete-go', { 'build': 'make','hook_post_update': ':UpdateRemotePlugins'})" \
 -c "call dein#direct_install('Shougo/vimproc.vim', { 'build': 'make' })" \
 -c "call dein#direct_install('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],'build': 'yarn --cwd app --frozen-lockfile install' })" \
 -c "call dein#direct_install('lymslive/vimloo', { 'merged': '0' })" \
 -c "call dein#direct_install('lymslive/vnote', { 'depends': 'vimloo' })" \
 -c "qall"
#
# ─── COC SETUP ──────────────────────────────────────────────────────────────────
#
mkdir -p ~/.config/coc/extensions
echo '{"dependencies":{}}'> ~/.config/coc/extensions/package.json
IFS=' ' read -a coc_packages <<< $(nvim --headless -c 'for plugin in g:coc_global_extensions | echon plugin " " | endfor' -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1)
if [ ${#coc_packages[@]} -ne 0  ];then
  $(which yarn) add --cwd ~/.config/coc/extensions --frozen-lockfile --ignore-engines "${coc_packages[@]}"
fi
#
# ─── POTENTIAL FIX FOR SOME DEOPLETE BUGS ───────────────────────────────────────
#
if [ -r "$HOME/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py" ]; then
sed -i \
   -e '/def gather_candidates/a\        return []' \
   -e '/def get_complete_result/a\        return []' \
   -e '/def find_gocode_binary/a\        return "/bin/true"' \
"$HOME/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py"
echo 'finish' >  "$HOME/.cache/vimfiles/repos/github.com/zchee/deoplete-go/plugin/deoplete-go.vim"
fi
mv "$HOME/.SpaceVim/autoload/SpaceVim/plugins.vim.bak" "$HOME/.SpaceVim/autoload/SpaceVim/plugins.vim"
# ────────────────────────────────────────────────────────────────────────────────
echo >&2 "*** installing NPM packages required by SpaceVim."
sudo $(which yarn) --silent global add --prefix /usr/local \
  markdown-magic \
  remark \
  remark-cli \
  remark-stringify \
  remark-frontmatter \
  wcwidth \
  prettier \
  bash-language-server \
  dockerfile-language-server-nodejs \
  standard-readme-spec
# ────────────────────────────────────────────────────────────────────────────────
echo >&2 "*** installing pip packages required by SpaceVim."
$(which python3) -m pip install --user notedown

# https://raw.githubusercontent.com/arthurnavah/environment/master/update.sh
nvim --headless \
 -c "call dein#clear_state()" \
 -c "call dein#update()" \
 -c "call dein#recache_runtimepath()" \
 -c "call dein#remote_plugins()" \
 -c "UpdateRemotePlugins" \
 -c "call dein#save_state()" \
 -c "qall"
[ -d "${HOME}/.SpaceVim/bundle/vimproc.vim" ] && make -C ~/.SpaceVim/bundle/vimproc.vim ;
healthcheck=$(timeout 10 nvim --headless -c 'checkhealth' -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1)
echo "${healthcheck}" | grep -v 'perl' | grep -q ERROR && ( echo '########### healthcheck error ###########' ; echo "${healthcheck}" )
