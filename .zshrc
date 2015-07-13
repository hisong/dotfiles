# Emacs風キーバインド
bindkey -e

# プロンプト
autoload -Uz vcs_info
autoload -Uz colors; colors
## エスケープシーケンスを有効にする
setopt prompt_subst
## vcs関連の設定
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
## 通常のプロンプト
PROMPT="
%F{red}[%D{%Y/%m/%d %T}]%f
%F{green}${USER}@${HOST}%f %F{yellow}%~%f %1(v|%F{green}%1v%f|)
%(!.#.$) "
### 入力間違い時のメッセージ
#SPROMPT="%{${fg[red]}%}%r is correct?%{${reset_color}%} [%BY%bes, %BN%bo, %BA%bbort, %BE%bdit]: "
## 色付け
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f ${HOME}/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ${HOME}/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ${HOME}/.dircolors)
  fi
fi

# ディレクトリ移動
## ディレクトリ名だけでcdする
setopt auto_cd
## cdで移動してもpushdと同じようにディレクトリスタックに追加する
setopt auto_pushd
## ディレクトリスタックの古い方の重複を削除する
setopt pushd_ignore_dups
## ディレクトリスタックの数を設定する
DIRSTACKSIZE=20

# ヒストリ
## ヒストリを保存するファイルを指定する
HISTFILE=${HOME}/.zsh_history
## ヒストリサイズを指定する
HISTSIZE=10000
## 保存するヒストリ数を指定する
SAVEHIST=${HISTSIZE}
## ヒストリファイルにコマンドだけではなく実行時刻と実行時間も保存する
setopt extended_history
## 重複するコマンドが記憶される時に古い方を削除する
setopt hist_ignore_all_dups
## 同じコマンドを連続で実行した場合はヒストリに登録しない
setopt hist_ignore_dups
## 重複するコマンドが補完される時に古い方を削除する
setopt hist_save_no_dups
## スペースで始まるコマンドはヒストリに追加しない
setopt hist_ignore_space
## すぐにヒストリファイルに追記する
setopt inc_append_history
## zshプロセス間でヒストリを共有する
setopt share_history
## 拡張globを使う
setopt extended_glob

# 補完
## 初期化
autoload -Uz compinit; compinit
## --prefix= とかの後のパス名も補完する
setopt magic_equal_subst
## カーソル位置で補完する
setopt complete_in_word
## 補完時にヒストリを自動的に展開する
setopt hist_expand
## 辞書順ではなく数字順に並べる
setopt numeric_glob_sort
### 間違い訂正
#setopt correct_all
## 補完候補のカーソル選択を有効化
zstyle ':completion:*' menu select=1
## 補完候補の色づけ
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
## 補完時にピリオド,ハイフン,アンダースコアを区切りとして認識させる
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

# その他
## ビープ音を鳴らさない
setopt no_beep
## Ctrl-Dでのログオフを無効にする
setopt ignoreeof

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

autoload history-search-end

zle -N launcheditor
zle -N cdup
zle -N cdold
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -e
bindkey '^@' launcheditor
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward

# エイリアス
## 素のvimを起動
alias vi='vim -u NONE -N'

## ファイル表示
case ${OSTYPE} in
  darwin*)
    alias ll='ls -lhaFG'
    ;;
  linux*)
    alias ll='ls -lhaF --color=auto'
    ;;
esac

case ${OSTYPE} in
  linux*)
    alias open='gnome-open'
    ;;
esac

# クリップボードへのコピー
if which pbcopy > /dev/null 2>&1; then
  alias -g c='| pbcopy'
elif which xclip > /dev/null 2>&1; then
  alias -g c='| xclip -i -sel c'
fi

# 検索関連関数定義
if which w3m > /dev/null 2>&1; then
  function ggl() {
    if [ ${#} -eq 0 ]; then
      w3m "https://www.google.co.jp/"
    else
      w3m "https://www.google.co.jp/search?ie=UTF-8&q=${1}"
    fi
  }

  function ddg() {
    if [ ${#} -eq 0 ]; then
      w3m "https://duckduckgo.com/?kl=jp-jp&kp=-1&ki=-1"
    else
      w3m "https://duckduckgo.com/?kl=jp-jp&kp=-1&ki=-1&q=${1}"
    fi
  }
fi

compdef mosh=ssh

# vim:set ft=zsh sw=2 sts=2 nowrap:
