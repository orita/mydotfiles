# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# cd でTabを押すとdir list を表示
setopt auto_pushd

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# コマンドのスペルチェックをする
setopt correct

# コマンドライン全てのスペルチェックをする
#setopt correct_all

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
#setopt auto_menu

# beepを鳴らさないようにする
setopt nolistbeep

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups

# historyの共有
setopt share_history

# 余分な空白は詰める
setopt hist_reduce_blanks

# add history when command executed.
setopt inc_append_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

#alias
alias ll="ls -Fal"
## flush dns cache yosemite
alias flushdnscache="sudo discoveryutil udnsflushcaches"

# 色付ける
autoload colors
colors

# zsh: no matches foundやめる
setopt nonomatch

#PROMPT PS1
case ${UID} in
0)
  #RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  PROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}
[%n@%m] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  ;;
*)
  #RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  PROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}
[%n@%m]%{${fg[blue]}%}$%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  ;;
esac

## エイリアス
setopt complete_aliases

case "${OSTYPE}" in
freebsd*|darwin*)
alias ls="ls -G -w"
;;
linux*)
alias ls="ls --color"
;;
esac
alias ll="ls -Fal"

## 検索
export TEXT_BROWSER=w3m

function _space2p20
{
    echo $@ |sed -e "s/ /%20/g"
}

function _space2plus
{
    echo $@ | sed -e "s/ /+/g"
}

function google
{
    ${TEXT_BROWSER} "http://www.google.co.jp/search?q="`_space2plus $@`"&hl=ja"
}

function ydic
{
    ${TEXT_BROWSER} "http://dic.yahoo.co.jp/dsearch?enc=UTF-8&p="`_space2plus $@`"&stype=0&dtyp
e=2"
}

function technorati
{
    ${TEXT_BROWSER} http://www.technorati.com/search/`_space2p20 $@`"?language=ja"
}

function wikipedia
{
    ${TEXT_BROWSER} http://ja.wikipedia.org/wiki/`_space2p20 $@`
}

# zsh-completions
autoload -U compinit
fpath=(/usr/local/share/zsh-completions $fpath)
compinit

# boot2docker
#$(boot2docker shellinit)

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# phpenv
#export PATH=$PATH:~/.phpenv/bin
#eval $(phpenv init -)

# direnv
eval "$(direnv hook zsh)"

# Visual Studio Code
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

#gcp
source gcp/noplan-isucon/dot.envrc 

