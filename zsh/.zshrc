# Powerlevel9k
# Powerlevel9k config from xr1s/dotfiles
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_CUSTOM_EMOJI='prompt_emoji'
POWERLEVEL9K_CUSTOM_EMOJI_BACKGROUND='white'
POWERLEVEL9K_CUSTOM_EMOJI_FOREGROUND='black'
function prompt_emoji() {
  readonly EMOJI=(
    '_(´ཀ`」 ∠)__'
    "~o(〃'▽ '〃)o"
    '( ￣ー￣)人(^▽ ^ )击掌'
    '( *・ω・)✄╰ひ╯'
    'へ(._へ)sᴋʀ'
    '(งᵒ̌皿ᵒ̌)ง⁼³₌₃'
    '｡･ﾟﾟ･(>д<;)･ﾟﾟ･｡'
    '(╯°Д°)╯︵ ┻━┻'
    '๛ ก(ｰ̀ωｰ́ก)'
    'ʕง•ᴥ•ʔง'
  )
  echo "${EMOJI[$$ % ${#EMOJI[@]} + 1]}"
}
# Windows Terminal will transparent 'black' background, use color code
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='233'
POWERLEVEL9K_STATUS_OK_BACKGROUND='233'
POWERLEVEL9K_OS_ICON_BACKGROUND='233'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context dir dir_writable newline custom_emoji vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time os_icon)

# Theme
source $HOME/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# Plugins
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# https://github.com/zsh-users/zsh-autosuggestions
source $HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# https://github.com/zsh-users/zsh-history-substring-search


# Command not found
source /etc/zsh_command_not_found

# Misc
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Alias
alias ls=exa
# https://github.com/ogham/exa
alias rm=trash
# pip3 install trash-cli

# Fuck
# pip3 install thefuck
fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}

# Rustup
# https://rustup.rs/
[[ -s $HOME/.cargo/env ]] && source $HOME/.cargo/env

# N
# https://github.com/tj/n
export N_PREFIX="$HOME/.n"
export N_PRESERVR_NPM=1

# go
export GOPATH="$HOME/.go"

# PATH
PATH="$HOME/.local/bin:$N_PREFIX/bin:$GOPATH/bin/:$PATH:/sbin:/usr/sbin"

# SDKMAN
# https://sdkman.io
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/home/yadomin/.sdkman/bin/sdkman-init.sh"
