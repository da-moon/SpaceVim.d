#!/usr/bin/env bash
# vim: ft=sh tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set -xeuo pipefail

#
# ─── CLEAN UPS ──────────────────────────────────────────────────────────────────
#

if command -- "$(which pip3 2>/dev/null)" --version > /dev/null 2>&1 ; then
  echo >&2 "*** ensuring all existing neovim related python packages are removed."
  sudo "$(which python3)" -m pip uninstall -yq "neovim" "pynvim" "msgpack" "greenlet" >/dev/null 2>&1  || true
  "$(which python3)" -m pip uninstall -yq "neovim" "pynvim" "msgpack" "greenlet" >/dev/null 2>&1  || true
fi
if command -- "$(which pacman 2>/dev/null)" --version > /dev/null 2>&1 ; then
  pacman -Qi "python-pynvim" > /dev/null 2>&1 && sudo pacman -Rcns --noconfirm "python-pynvim"
  pacman -Qi "python-pip" > /dev/null 2>&1 && sudo pacman -Rcns --noconfirm "python-pip"
  pacman -Qi "python2-pip" > /dev/null 2>&1 && sudo pacman -Rcns --noconfirm "python2-pip"
fi
if command -- "$(which apt-get 2>/dev/null)" --version > /dev/null 2>&1 ; then
  [ -n "$( (dpkg-query -W --showformat='${Status}\n' python3-neovim 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get remove --purge -yqq "python3-neovim"
  [ -n "$( (dpkg-query -W --showformat='${Status}\n' python3-pip 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get remove --purge -yqq "python3-pip"
  [ -n "$( (dpkg-query -W --showformat='${Status}\n' python-pip 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get remove --purge -yqq "python-pip"
fi
# TODO change this to npm
if command -- "$(which yarn 2>/dev/null)" --version > /dev/null 2>&1 ; then
  sudo "$(which yarn)" global remove "neovim"  >/dev/null 2>&1  || true
fi
# if (command -v perl && command -v cpanm) >/dev/null 2>&1; then
#   sudo cpanm -S -f -q --uninstall Neovim::Ext  > /dev/null 2>&1 || true
#   cpanm --local-lib=~/perl5 local::lib && eval "$(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)"
#   cpanm -f -q --uninstall Neovim::Ext > /dev/null 2>&1 || true
# fi
#
# ─── PROVIDER INSTALLATION ──────────────────────────────────────────────────────
#
if command -- "$(which pacman 2>/dev/null)" --version > /dev/null 2>&1 ; then
  # ! pacman -Qi cpanminus > /dev/null 2>&1 && sudo pacman -Sy --noconfirm cpanminus
  ! pacman -Qi "gawk" > /dev/null 2>&1 && sudo pacman -Sy --noconfirm "gawk"
  #main: line 390: fc-cache: command not found
  ! pacman -Qi "fontconfig" > /dev/null 2>&1 && sudo pacman -Sy --noconfirm "fontconfig"
  #main: line 391: mkfontdir: command not found
  ! pacman -Qi "xorg-mkfontdir" > /dev/null 2>&1 && sudo pacman -Sy --noconfirm "xorg-mkfontdir"
  #main: line 392: mkfontscale: command not found
  ! pacman -Qi "xorg-mkfontscale" > /dev/null 2>&1 && sudo pacman -Sy --noconfirm "xorg-mkfontscale"
fi
if command -- "$(which apt-get 2>/dev/null)" --version > /dev/null 2>&1 ; then
  # [ -z "$( (dpkg-query -W --showformat='${Status}\n' "cpanminus" 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install cpanminus -yqq
  [ -z "$( (dpkg-query -W --showformat='${Status}\n' "gawk" 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install gawk -yqq
  [ -z "$( (dpkg-query -W --showformat='${Status}\n' "xfonts-utils" 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install -yqq xfonts-utils
  [ -z "$( (dpkg-query -W --showformat='${Status}\n' "fontconfig" 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install -yqq fontconfig
  [ -z "$( (dpkg-query -W --showformat='${Status}\n' "python3-venv" 2>&1 || true )|(grep "install ok installed" || true))" ] && sudo apt-get update -qq && sudo apt-get install python3-venv -yqq
fi
[ -n "$(which python3)" ] \
&& ! command -- "$(which python3)" -m pip --version > /dev/null 2>&1 \
  && (curl -fsSl "https://bootstrap.pypa.io/get-pip.py" | sudo "$(which python3)")

[ -n "$(which python2)" ] \
&& ! command -- "$(which python2)" -m pip --version > /dev/null 2>&1 \
  && (curl -fsSl "https://bootstrap.pypa.io/pip/$(\
  "$(which python2)" --version 2>&1 \
    | gawk 'BEGIN{FS=OFS="."}{gsub("[^[:digit:].]*","");print $1,$2}' \
    )/get-pip.py" | sudo "$(which python2)")
! command -- "$(which npm 2>/dev/null)" --version > /dev/null 2>&1 \
  && (curl -fsSL "install-node.vercel.app" | sudo sh -s -- --yes --verbose --prefix="/usr/local")
if ! command -- "$(which yarn 2>/dev/null)" --version > /dev/null 2>&1; then
  command -- "$(which pacman 2>/dev/null)" --version > /dev/null 2>&1 && sudo pacman -S --noconfirm yarn
  if command -- "$(which apt-get 2>/dev/null)" --version > /dev/null  2>&1; then
    curl -fsSL "https://dl.yarnpkg.com/debian/pubkey.gpg" | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee "/etc/apt/sources.list.d/yarn.list" > /dev/null
    sudo apt-get -qq update && sudo apt-get -yqq install "yarn"
  fi
fi
sudo chmod a+x "$(which npm)" ;
sudo chmod a+x "$(which yarn)" ;
# ─────────────────────────────────────────────────────────────────────
[ -n "$(which python3)" ] \
&& command -- "$(which python3)" -m pip --version > /dev/null 2>&1 \
&& "$(which python3)" -m pip install --user -U "pynvim" "future"
# ─────────────────────────────────────────────────────────────────────
[ -n "$(which python2)" ] \
&& command -- "$(which python2)" -m pip --version > /dev/null 2>&1 \
&& "$(which python2)" -m pip install --user -U "pynvim"
# ─────────────────────────────────────────────────────────────────────

# ! npm list --depth 1 --global "neovim" > /dev/null 2>&1 \
sudo npm -g install "neovim" \
|| sudo "$(which npm)" -g install "neovim" \
|| sudo "$(which node)" "$(which npm)" -g install "neovim"

# ─────────────────────────────────────────────────────────────────────
### yes | sudo perl -MCPAN -e 'upgrade'
# sudo cpanm -n -S -f -q Neovim::Ext
# ─────────────────────────────────────────────────────────────────────
#
# ─── SPACEVIM ───────────────────────────────────────────────────────────────────
#
sudo /bin/rm -rf \
  "${HOME}/.SpaceVim" \
  "${HOME}/.cache/SpaceVim" \
  "${HOME}/.cache/neosnippet" \
  "${HOME}/.config/coc" \
  "${HOME}/.vim"* \
  "${HOME}/.config/"*vim* \
  "${HOME}/.cache/"*vim* \
  "${HOME}/.local/share/"*vim* ;

[ ! -r "${HOME}/.SpaceVim.d/init.vim.bak" ] \
&& sed -i.bak -e '/lua require/d' "${HOME}/.SpaceVim.d/init.vim" ;

sed -i \
  -e 's/chadtree/defx/g' \
  "${HOME}/.SpaceVim.d/autoload/before/spacevim/filemanager/init.vim"
# ─────────────────────────────────────────────────────────────────────
curl -sLf "https://spacevim.org/install.sh" | bash
# ────────────────────────────────────────────────────────────────────────────────

[ -r "${HOME}/.SpaceVim/autoload/SpaceVim/plugins.vim" ] && sed -i.bak 's/call dein#add/"call dein#add/g' "${HOME}/.SpaceVim/autoload/SpaceVim/plugins.vim"
mkdir -p "${HOME}/.local/share/nvim/shada"
# [ NOTE ] => https://herringtondarkholme.github.io/2016/02/26/dein/
# ─────────────────────────────────────────────────────────────────────
timeout --signal=SIGKILL 120  nvim --headless \
  -c ":echon \"\\n\\n######\\tInstalling core plugins ...\\t#####\\n\\n\"" \
  -c "call dein#direct_install('deoplete-plugins/deoplete-go', { 'build': 'make','hook_post_update': ':UpdateRemotePlugins'})" \
  -c "qall" || true ;
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('neoclide/coc.nvim', { 'merged': 0,'build':'yarn install --frozen-lockfile'})" \
  -c "qall" || true ;
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],'build': 'yarn --cwd app --frozen-lockfile install' })" \
  -c "qall" || true ;
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('Shougo/vimproc.vim', { 'build': 'make' })" \
  -c "qall" || true ;

timeout --signal=SIGKILL 120  nvim --headless \
  -c ":echon \"\\n\\n######\\tInstalling some extra plugins ...\\t#####\\n\\n\"" \
  -c "call dein#direct_install('davidhalter/jedi-vim')" \
  -c "qall" || true ;
  timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('jaxbot/github-issues.vim')" \
  -c "qall" || true ;
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('lymslive/vimloo', { 'merged': '0' })" \
  -c "qall" || true ;
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('lymslive/vnote', { 'depends': 'vimloo' })" \
  -c "qall" || true ;

timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('tyru/open-browser.vim')" \
  -c "qall" || true ;

timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#direct_install('tyru/open-browser-github.vim', { 'depends': 'open-browser.vim' })" \
  -c "qall" || true ;


mkdir -p "${HOME}/.config/coc/extensions"
echo '{"dependencies":{}}' > "${HOME}/.config/coc/extensions/package.json"
IFS=' ' read -ra coc_packages <<< "$(nvim --headless -c 'for plugin in g:coc_global_extensions | echon plugin " " | endfor' -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1)"
IFS=' ' read -ra lsp_clients <<< "$(nvim --headless -c 'for plugin in g:enabled_clients | echon plugin " " | endfor' -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1)"
if [ ${#coc_packages[@]} -ne 0  ];then
  echo >&2 "*** installing coc plugins: ${coc_packages[*]}"
  npm install --prefix "${HOME}/.config/coc/extensions" --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod "${coc_packages[@]}" \
  || "$(which npm)" install --prefix "${HOME}/.config/coc/extensions" --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod "${coc_packages[@]}" \
  || "$(which node) $(which npm)" install --prefix "${HOME}/.config/coc/extensions" --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod "${coc_packages[@]}" \
  || true
fi

[ -r "${HOME}/.SpaceVim/autoload/SpaceVim/plugins.vim.bak" ] \
&& mv "${HOME}/.SpaceVim/autoload/SpaceVim/plugins.vim.bak" "${HOME}/.SpaceVim/autoload/SpaceVim/plugins.vim"
# timeout --signal=SIGKILL 120  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1 || true 
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#clear_state()" \
  -c "call dein#update()" \
  -c "call dein#recache_runtimepath()" \
  -c "call dein#remote_plugins()" \
  -c "UpdateRemotePlugins" \
  -c "call dein#save_state()" \
  -c "qall" || true

timeout --signal=SIGKILL 120  nvim --headless \
  -c 'TSUpdate' \
  -c 'qall' || true
[ -d "${HOME}/.SpaceVim/bundle/vimproc.vim" ] && make -C "${HOME}/.SpaceVim/bundle/vimproc.vim" ; 
# ─────────────────────────────────────────────────────────────────────
echo >&2 "*** installing NPM packages required by SpaceVim."
YARN_GLOBAL_PACKAGES=(
  "markdown-magic"
  "remark"
  "remark-cli"
  "remark-stringify"
  "remark-frontmatter"
  "wcwidth"
  "prettier"
  "bash-language-server"
  "dockerfile-language-server-nodejs"
  "standard-readme-spec"
)
sudo yarn --silent global add --prefix "/usr/local" "${YARN_GLOBAL_PACKAGES[@]}" \
|| sudo "$(which yarn)" --silent global add --prefix "/usr/local" "${YARN_GLOBAL_PACKAGES[@]}" \
|| sudo "$(which node) $(which yarn)" --silent global add --prefix "/usr/local" "${YARN_GLOBAL_PACKAGES[@]}"

# ────────────────────────────────────────────────────────────────────────────────

echo >&2 "*** installing pip packages required by SpaceVim."
# https://github.com/mhinz/neovim-remote/blob/master/contrib/completion.bash
"$(which python3)" -m pip install --user "notedown" "neovim-remote"
[ -n "which ansible" ] && [ ! -z "$(which ansible-lint)" ] && "$(which python3)" -m pip install --user -U "ansible-lint"
[ ! -z "$(which yamllint)" ] && "$(which python3)" -m pip install --user -U "yamllint"

# healthcheck=$(timeout 10 nvim --headless -c 'checkhealth' -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1 || true )
# echo "${healthcheck}" | grep -v 'perl' | grep -q ERROR && ( echo '###########
# healthcheck error ###########' ; echo "${healthcheck}" )

if [ ${#lsp_clients[@]} -ne 0  ];then
  for client in ${lsp_clients[@]};do
    echo >&2 "*** installing lsp client: ${client}"
    timeout --signal=SIGKILL 120  nvim --headless -c "LspInstall ${client}"  -c 'silent write >> /dev/stdout' -c 'quitall' 2>&1 || true
  done
fi
mv "${HOME}/.SpaceVim.d/init.vim.bak" "${HOME}/.SpaceVim.d/init.vim"
timeout --signal=SIGKILL 120  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'quitall' || true
sed -i \
  -e 's/defx/chadtree/g' \
  "${HOME}/.SpaceVim.d/autoload/before/spacevim/filemanager/init.vim";
timeout --signal=SIGKILL 120  nvim --headless \
  -c "call dein#update()" \
  -c "call dein#recache_runtimepath()" \
  -c "call dein#remote_plugins()" \
  -c "UpdateRemotePlugins" \
  -c "qall" || true;
