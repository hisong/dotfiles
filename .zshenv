# 環境変数の設定
## LANG
export LANG=ja_JP.UTF-8

## path
path=(
  ${HOME}/bin(N-/)
  /usr/lib/lightdm/lightdm(N-/)
  {/usr/local,/usr,}{/sbin,/bin}(N-/)
)
typeset -gxU path

## manpath
manpath=(
  {/usr/local,/usr}{,/share}/man(N-/)
)
typeset -gxU manpath

## 重複削除
typeset -gxU path cdpath fpath manpath ld_library_path include

# vim:set ft=zsh sw=2 sts=2 nowrap:
