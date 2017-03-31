# 環境変数の設定
## LANG
export LANG=ja_JP.UTF-8
export VTE_CJK_WIDTH=1

## EDITOR
export EDITOR=vim

## Go
export GOPATH=${HOME}/go

## TERM
export TERM=xterm-256color

## Java
#export JAVA_HOME=/usr/lib/jvm/java-6-oracle

## ANDROID_HOME
#export ANDROID_HOME=${HOME}/bin/android-studio/sdk

## python
#export WORKON_HOME=${HOME}/.virtualenvs
#export PROJECT_HOME=${HOME}/Devel
#source /usr/local/bin/virtualenvwrapper.sh

## path
#--------------------------------------------------
# typeset
#   -g グローバルフラグ
#   -x exportも同時に行う
#   -U 重複パスを登録しない
#   -T 環境変数へひも付け
#
# path=xxxx(N-/)
#   (N-/):  存在しないディレクトリは登録しない
#   パス(...):  ...という条件にマッチするパスのみ残す
#       N: NULL_GLOBオプションを設定
#           globがマッチしなかったり存在しないパスを無視する
#       -: シンボリックリンク先のパスを評価
#       /: ディレクトリのみ残す
#       .: 通常のファイルのみ残す
#--------------------------------------------------
path=(
  # 共通
  ${HOME}/bin(N-/)
  ${HOME}/.nodebrew/current/bin(N-/)
  ${HOME}/.rbenv/bin(N-/)
  # linux用
  /usr/lib/lightdm/lightdm(N-/)
  {/usr/local,/usr,}{/sbin,/bin}(N-/)
  ${HOME}/bin/android-studio/sdk/{tools,platform-tools}(N-/)
  ${HOME}/bin/android-studio/bin(N-/)
  ${HOME}/bin/genymotion(N-/)
  ${GOPATH}/bin(N-/)
  # mac用
  ${HOME}/adt-bundle-mac-x86_64-20131030/sdk/platform-tools(N-/)
  # 共通
  ${path}
)
typeset -gxU path

## fpath
fpath=(
  ${HOME}/vcs/dotfiles/.zsh.d/functions/zsh-completions(N-/)
  ${HOME}/.rbenv/completions(N-/)
  ${fpath}
)
typeset -gxU fpath

## manpath
manpath=(
  {/usr/local,/usr}{,/share}/man(N-/)
  ${manpath}
)
typeset -gxU manpath

## 重複削除
typeset -gxU path cdpath fpath manpath ld_library_path include

## rbenv
if which rbenv > /dev/null 2>&1; then
    eval "$(rbenv init -)"
fi

# vim:set ft=zsh sw=2 sts=2 nowrap:
