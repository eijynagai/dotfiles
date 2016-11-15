# ----------------------------------------------------------------------
# .bashrc (nagai)
# ----------------------------------------------------------------------
# If not running interactively, don't do anything:

[ -z "$PS1" ] && return

ulimit -c 0   # coredumpsize : maximum size of "core" files created
umask 022     # umask command deterimines the mode of new file created. 022 means that the mode of new file is 644(rw-r--r--).
export EDITOR=emacs

# ----------------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

shopt -s checkwinsize

# ----------------------------------------------------------------------
# enable color support of ls and also add handy aliases
#TERM = environmental variable which defines "the types of terminal".

if [ "$TERM" = "xterm" ]; then
    export TERM=xterm-color
fi

# ----------------------------------------------------------------------
# colored prompt

case "$TERM" in
xterm*|rxvt*|kterm*|screen*)
    #PROMPT_COMMAND: if set, the value is interpreted as a command to execute before the printing of $PS1.
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"' #-n:do not output the trailing newline, -e:enable interpretation of backslash escapes
    case `uname` in
	Linux)
            #PS1 = environmental variable which defines "prompt".
	    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$ '
	    ;;
    esac
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# ----------------------------------------------------------------------
# FreeBSD, Linux & Darwin

case `uname` in
Linux)
    #dircolors command: dircolors [file] [option]
    #eval "`dircolors .dir_colors -b`"
    alias ls='ls -Fh --color=auto'
    ;;
FreeBSD)
    alias ls='ls -GF'
    alias vi='vim'
    alias lpr='/usr/bin/lpr'
    alias lpq='/usr/bin/lpq'
    alias lprm='/usr/bin/lprm'
    export CANNAHOST=canna
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    ;;
Darwin)
    alias ls='ls -GFht'
    alias ll='ls -Gflhta'
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/man:$MANPATH
    ;;
SunOS)
    alias ls='ls -GF --color'
    export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/ccs/bin:/usr/sfw/bin:/usr/openwin/bin
    ;;
esac

#---------------------------------------------------------------------
#share history between sessions
#function share_history { # ?ʲ??????Ƥ?ؿ??Ȥ??????
#    history -a # .bash_history?????󥳥ޥ?ɤ?1???ɵ?
#    history -c # ü?????????????????ö?õ?
#    history -r # .bash_history??????????ɤ߹???ľ??
#}
#PROMPT_COMMAND='share_history' # ?嵭?ؿ???ץ???ץ???˼?ư?»?
#shopt -u histappend # .bash_history?ɵ??⡼?ɤ????פʤΤ?OFF??

export HISTSIZE=25000
export HISTCONTROL=ignoreboth
export HISTIGNORE=?:ll:ls*:exit:history:top:qstat:\;s
#----------------------------------------------------------------------


# ----------------------------------------------------------------------
# Put your private configurations in ~/.cshrc.private

if [ -e ~/.bashrc.private ]; then
  source ~/.bashrc.private
fi
