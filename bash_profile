# prompt

prompton='\[\e[7;1m\]'
promptoff='\[\e[0m\]'

PS1=("$prompton \u@\h $promptoff $prompton \w $promptoff $prompton $? $promptoff \n\$ ")

unset prompton
unset promptoff

# path

PATH=$PATH:~/bin:~/arpconfig/bin:~/homebrew/bin/:~/git/actium/bin:~/Applications/MacVim.app/Contents/bin:/Applications/MacVim.app/Contents/bin/

source ~/perl5/perlbrew/etc/bashrc

# aliases / functions

. ~/arpconfig/alias.sh

# miscellaneous stuff

set -o ignoreeof

export LSCOLORS=GxCxHxHxdxHxHxDxDxGxGx
export CLICOLOR=
export LS_COLORS="di=01;36:ln=01;32:pi=01;37:so=01;37:ex=01;33:bd=01;37:cd=01;37"
export CDPATH=.:~
export FTP_PASSIVE=1
export BLOCKSIZE=1024
export EDITOR=/usr/bin/vi
export VR=~/Applications/MacVim.app/Contents/Reeources/vim/runtime

if [ ! -d /var/tmp/$USER ]; then
  mkdir /var/tmp/$USER
fi
if [ ! -d /var/tmp/$USER/vim-backups ]; then
  mkdir /var/tmp/$USER/vim-backups
fi
if [ ! -d /var/tmp/$USER/vim-swap ]; then
  mkdir /var/tmp/$USER/vim-swap
fi


export    LDFLAGS=-L/usr/local/opt/openssl/lib
export    CPPFLAGS=-I/usr/local/opt/openssl/include
 export PERL5LIB=$HOME/git/actium/lib:$HOME/git/Perl-Tidy-Sweetened/lib:$HOME/git/List-Flat/lib:$HOME/git/Array-2D-pm/lib:$HOME/git/English-Control/lib:$HOME/git/Array-2D/lib/:$HOME/githook-perltidy/lib:$HOME/ReallyNegative/lib
export BASH_SILENCE_DEPRECATION_WARNING=1
