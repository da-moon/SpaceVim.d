#!/usr/bin/env bash

set -xeuo pipefail

if command -- $(which pip3) --version > /dev/null 2>&1 ; then
  echo >&2 "*** ensuring all existing neovim related python packages are removed."
  $(which python3) -m pip uninstall -yq neovim pynvim msgpack greenlet >/dev/null 2>&1  || true
else
  echo >&2 "*** skipping Python package clean-ups as Python3 and Pip3 were not installed."
  true
fi
if command -- $(which yarn) --version > /dev/null 2>&1 ; then
  sudo $(which yarn) global remove neovim  >/dev/null 2>&1  || true
else
  echo >&2 "*** skipping NodeJs package clean-ups as Yarn was not installed."
fi
echo >&2 "*** cleaning up neovim leftover directories."
sudo python3 -m pip install neovim
sudo npm -g install neovim
rm -rf \
    ~/.SpaceVim \
    ~/.vim* \
    ~/.config/*vim* \
    ~/.cache/*vim* \
    ~/.cache/neosnippet \
    ~/.local/share/*vim*
curl -sLf https://spacevim.org/install.sh | bash
sed -i.bak 's/call dein#add/"call dein#add/g' "$HOME/.SpaceVim/autoload/SpaceVim/plugins.vim"
mkdir -p "$HOME/.local/share/nvim/shada"
sudo npm -g install neovim
python3 -m pip install --user notedown
nvim --headless \
-c "call dein#direct_install('deoplete-plugins/deoplete-go', { 'build': 'make' })" \
-c "call dein#direct_install('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],'build': 'yarn --cwd app --frozen-lockfile install' })" \
-c "call dein#direct_install('lymslive/vimloo', { 'merged': '0' })" \
-c "call dein#direct_install('lymslive/vnote', { 'depends': 'vimloo' })" \
-c "qall"
if [ -r "$HOME/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py" ]; then
sed -i \
    -e '/def gather_candidates/a\        return []' \
    -e '/def get_complete_result/a\        return []' \
    -e '/def find_gocode_binary/a\        return "/bin/true"' \
"$HOME/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py"
echo 'finish' >  "$HOME/.cache/vimfiles/repos/github.com/zchee/deoplete-go/plugin/deoplete-go.vim"
fi
mv "$HOME/.SpaceVim/autoload/SpaceVim/plugins.vim.bak" "$HOME/.SpaceVim/autoload/SpaceVim/plugins.vim"
nvim --headless \
  -c "call dein#install()" \
  -c "call dein#update()" \
  -c "call dein#remote_plugins()" \
  -c "call dein#recache_runtimepath()" \
  -c "UpdateRemotePlugins" \
  -c "qall" ; \
[ -d "${HOME}/.SpaceVim/bundle/vimproc.vim" ] && make -C ~/.SpaceVim/bundle/vimproc.vim ;
if command -- go version > /dev/null 2>&1 ; then
    nvim --headless \
    -c "GoInstallBinaries" \
    -c "GoUpdateBinaries" \
    -c "qall" || true
fi
