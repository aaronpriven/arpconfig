# Aliases (mostly widely applicable)

alias 'open.'='open .'
alias ,,=act-pvt.pl # changed from // in tcsh, sigh
alias ,=actium.pl # changed from / in tcsh, sigh
alias ..=octium.pl
alias ,t='act-pvt.pl time'
alias a+r='chmod a+r'
alias a+rx='chmod a+rx'
alias a+x='chmod a+x'
alias cd..='cd ..'
alias cd='cd -P'
alias cdf='cd "`finder-window-dir`"'
alias chdir='cd -P'
alias cls=clear
alias copy='cp -i'
alias cp='cp -i'
alias d='ls -AFsbk' 
alias dir='ls -AFbsk'
alias dl='ls -AFbl'
alias dvar='setenv DISPLAY :0.0'
alias excel="open -a 'Microsoft Excel'"
alias gfi=GetFileInfo
alias libre='open -a LibreOffice'
alias md=mkdir
alias mountall='open -a mount_all'
alias move='mv -i'
alias mv='mv -i'
alias o='open -a'
alias pf='perldoc -f'
alias preview='open -a Preview'
alias readable='chmod a+r'
alias ren='mv -i'
alias sf=SetFile
alias ss='actium.pl ss'
alias t="tree -A"
alias word='open -a Microsoft\ Word'
alias worddoc='SetFile -t W8BN -c MSWD'
alias wordtemplate='SetFile -t W8TN -c MSWD'

### vi aliases

alias realvi=/usr/bin/vi

mvim_command=`which mvim`
if [  ! -z "$mvim_command" ]; then
   alias vi="$mvim_command"
   alias vih="$mvim_command +Headway"
fi


alias ?%=printhash

function perlprint1 () {
#   set -f
   perl -I$HOME/bin -Mq -C63 -E "use utf8; say + $* ;" 
#   set +f
}

function perlprint2 () {
#   set -f
   perl -I$HOME/bin -Mq -C63 -E "use utf8; sub n {qq/\n/}; print join ( n , + $* ) , n ;" 
#   set +f
}

reset_expansion(){ CMD="$1";shift;$CMD "$@";set +f;}
alias ?='set -f;reset_expansion perlprint1'
alias ??='set -f;reset_expansion perlprint2'

# have to write shell functions for the below

function cw () { perl -cw `which "$*"` ; }
function pdc () { perldoc Perl::Critic::Policy::${1} ; }
function pdcc () { perldoc Perl::Critic::Policy::${1}::$2 ; }
function manfile () { groff -man -Tascii -fN $* | less ; }
function vp () { vi `perldoc -l "$*"` ;  }
function vv () { vi `which "$*"` ;  }
function moosetrait () { 
   trait=$1; 
   if [ -z "$trait" ]
   then
      moosetraitdirectory=`perldoc -l Moose::Meta::Attribute::Native::Trait::Hash`; 
      ls -1 `dirname $moosetraitdirectory` | sed 's/\.pm$//' | fmt
      unset moosetraitdirectory
   else
      shift ; 
      perldoc $* Moose::Meta::Attribute::Native::Trait::${trait} ; 
   fi
}

