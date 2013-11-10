# 環境変数の設定
## LANG
export LANG=ja_JP.UTF-8

## EDITOR
export EDITOR=vim

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
# mac側の設定--------------------------------------
### 重複パスを登録しない
#typeset -U path cdpath fpath manpath
### sudo用のpathを設定
#typeset -xT SUDO_PATH sudo_path
#typeset -U sudo_path
#sudo_path=({/usr/local,/usr,}/sbin(N-/))
### pathを設定
#path=(~/bin(N-/) /usr/local/bin(N-/) ~/nexus7/adt-bundle-mac-x86_64-20130514/sdk/platform-tools(N-/) ${path})
### fpathを設定
##fpath=(~/.zsh/functions/Completion(N-/) ${fpath})
### zsh-completions
### git://github.com/zsh-users/zsh-completions.git
#fpath=(~/.zsh/functions/Completion/zsh-completions(N-/) ${fpath})
#--------------------------------------------------
path=(
  ${HOME}/bin(N-/)
  /usr/lib/lightdm/lightdm(N-/)
  {/usr/local,/usr,}{/sbin,/bin}(N-/)
)
typeset -gxU path

## fpath
fpath=(
${HOME}/dotfiles/.zsh.d/functions/zsh-completions(N-/)
)
typeset -gxU fpath

## manpath
manpath=(
  {/usr/local,/usr}{,/share}/man(N-/)
)
typeset -gxU manpath

## 重複削除
typeset -gxU path cdpath fpath manpath ld_library_path include

# vim:set ft=zsh sw=2 sts=2 nowrap:
