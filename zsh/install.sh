#! /usr/bin/env bash

cd $HOME

mkdir -p .zsh/themes
mkdir -p .zsh/plugins

echo "Setting up themes"
cd ~/.zsh/themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k

cd ~/.zsh/plugins
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search

echo "Setting up python"
pip3 config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple
pip3 install -U pip
pip3 install trash-cli
pip3 install thefuck

echo "Setting up rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cat > ~/.cargo/config << EOF
[source.crates-io]
replace-with = \'tuna\'

[source.tuna]
registry = \"https://mirrors.bfsu.edu.cn/git/crates.io-index.git\"
EOF

echo "Setting SDKMAN"
curl -s "https://get.sdkman.io" | bash

echo "Setting Node"
export N_PREFIX="$HOME/.n"
curl -L https://git.io/n-install | bash

curl https://cdn.jsdelivr.net/gh/YadominJinta/dotfiles/zsh/.zshrc -o ~/.zshrc
