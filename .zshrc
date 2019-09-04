# ~/.zshrc is loaded after ~/.zshenv and /etc/zshrc
# vim: set ft=zsh fdm=marker:

PURE_PROMPT_SYMBOL=''

# Plugins {{{1
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug --self-manage
fi
source ~/.zplug/init.zsh

# zplug should manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Theme
zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh, as:theme

zplug 'Tarrasch/zsh-autoenv'
zplug 'djui/alias-tips'

zplug 'supercrabtree/k'
zplug 'wfxr/forgit'

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug 'zsh-users/zsh-history-substring-search'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Options {{{1

# no c-s/c-q output freezing (it's usually unintentional)
setopt noflowcontrol
# allow expansion in prompts
setopt prompt_subst
# this is default, but set for share_history
setopt append_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history
# display PID when suspending processes as well
setopt longlistjobs
# try to avoid the 'zsh: no matches found...'
setopt nonomatch
# report the status of backgrounds jobs immediately
setopt notify
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all
# not just at the end
setopt completeinword
# use zsh style word splitting
setopt noshwordsplit
# allow use of comments in interactive code
setopt interactivecomments
# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt noextended_glob
# don't error out when unset parameters are used
setopt unset
# don't ever correct spellin errors please
setopt nocorrect
# watch for everyone but me and root
watch=(notme root)
# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath
# import new commands from the history file also in other zsh-session
setopt share_history
# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
setopt histignorealldups
# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace
# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup
# avoid "beep"ing
setopt nobeep
# make cd push the old directory onto the directory stack.
#setopt auto_pushd
# don't push the same dir twice.
#setopt pushd_ignore_dups
# * shouldn't match dotfiles. ever.
setopt noglobdots
# Better umask
umask 022

# Environment {{{1
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR=vim
export PAGER=less
export MAIL="/var/mail/$USER"
#export REPORTTIME=60
export DIRSTACKSIZE=20
export DIRSTACKFILE=$HOME/.zdirstack

# Keybindings {{{1

bindkey -e

# Let me edit a command in my $EDITOR:
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Completions {{{1
zstyle ':completion:*' use-cache true
autoload -U compinit
compinit -d ~/.zcompdump

# Sourcing External {{{1
[[ -f ~/.zalias ]] && source ~/.zalias
[[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
if [[ -d ~/.zdir ]]; then
    for file in ~/.zdir/*.zsh; do
        [[ -f "$file" ]] && source "$file"
    done
    if [[ -d "~/.zdir/+$(hostname)" ]]; then
        for file in ~/.zdir/+$(hostname)/*.zsh; do
            [[ -f "$file" ]] && source "$file"
        done
    fi
fi
