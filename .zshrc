setopt no_beep                # ビープを無効化
setopt auto_pushd             # cd時にTab補完
setopt pushd_ignore_dups      # ディレクトリスタックの重複を削除(古い方)
DIRSTACKSIZE=20               # ディレクトリスタックの数を設定
setopt ignoreeof              # Ctrl-Dでのログオフを無効化

function launcheditor() {
  exec < /dev/tty
  ${EDITOR}
  zle reset-prompt
}

function cdup() {
  echo
  cd ..
  zle reset-prompt
}

function cdold() {
  echo 
  cd - >/dev/null 2>&1
  zle reset-prompt
}

zle -N launcheditor
zle -N cdup
zle -N cdold
zle -N history-beginning-search-backward
zle -N history-beginning-search-forward

bindkey -e
bindkey '\@' launcheditor
bindkey '\^' cdup
bindkey '\-' cdold
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# vim:set ft=zsh sw=2 sts=2 nowrap:
