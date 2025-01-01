# export QT_QPA_PLATFORMTHEME=qt5ct
export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$PATH:$ANDROID_HOME/emulator

export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$ANDROID_HOME/tools
export GOPATH=$HOME/go/
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.config/tmux/plugins/tmuxifier/bin
alias sudoedit='sudo -e'

eval "$(tmuxifier init -)"
export EDITOR=nvim
# alias vim=nvim
alias w=nvim
alias dotfiles="cd ~/git-pkg/dotfiles/"
alias clr=clear
alias c=clear
alias lg=lazygit
alias kittyconf="nvim ~/.config/kitty/kitty.conf"
alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
alias quteconf="nvim ~/.config/qutebrowser/config.py"
alias tmx="tmuxifier"
alias tmxls="tmuxifier list-sessions"
alias tmxn="tmuxifier new-session"
alias tmxl="tmuxifier load-session"
alias tmxe="tmuxifier edit-session"
alias tkss="tmux kill-session -t"
alias please='sudo $(fc -ln -1)'
alias r='$(fc -ln -1)'
alias wscreenkey="GDK_BACKEND=x11 screenkey"
alias e="exit"
alias f="fzf"
alias lg="lazygit"
alias ls="eza --color=always --icons=always --no-user"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# --bind 'ctrl+n:execute(echo {+} | xargs -o nvim)'
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf 
"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "
# yazi-config
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# INFO: These are the plugins to use in zsh
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions npm zsh-autocomplete tmux)
