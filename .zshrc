# Emacs風キーバインド
bindkey -e

# プロンプト
autoload -Uz colors; colors
## エスケープシーケンスを有効にする
setopt prompt_subst
## 通常のプロンプト
PROMPT="
%{${fg[red]}%}[%D{%Y/%m/%d %T}]
%{${fg[green]}%}${USER}@${HOST} %{${fg[yellow]}%}%~%{${reset_color}%}
%(!.#.$) "
## 入力間違い時のメッセージ
SPROMPT="%{${fg[red]}%}%r is correct?%{${reset_color}%} [%BY%bes, %BN%bo, %BA%bbort, %BE%bdit]: "
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
HISTSIZE=1000000
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
## 間違い訂正
setopt correct_all
## 補完候補のカーソル選択を有効化
zstyle ':completion:*' menu select=1
## 補完候補の色づけ
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

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
bindkey '\^' cdup
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward

# エイリアス
## ファイル表示
case ${OSTYPE} in
  darwin*)
    alias ll='ls -lhaFG'
    ;;
  linux*)
    alias ll='ls -lhaF --color=auto'
    ;;
esac

## ファイル操作に確認を入れるようにする
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# vim:set ft=zsh sw=2 sts=2 nowrap:
