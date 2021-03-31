# Path to your oh-my-bash installation.
export OSH=/opt/adminuser/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
# OSH_THEME="font"
OSH_THEME="purity"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

################# Anant's custom config ###############################
export VISUAL=vim
export GIT_EDITOR=$VISUAL
export EDITOR=$VISUAL
# vim is our vi
alias vi=vim

alias lsd="ls -G -d */"
# list ONLY files in current directory
alias lsf="find . -maxdepth 1 -type f -print"
# alias ls='ls -GF'
alias ls='ls -F'
alias cls='clear'
xtitle() { echo -ne "\033]0;${*}\a"; }

#alias gvim='gvim -geom 120x48+96+96'
alias more=less

alias pep='tox -v -epep8'
alias pyp='tox -v -epy27'
alias pyp3='tox -v -epy34'
alias trunall='pep && pyp && pyp3'
alias trun='python -m testtools.run'
alias 1='source .tox/py27/bin/activate'
alias 2='source .tox/integration/bin/activate'
alias trun='python -m testtools.run'
alias ipython='ipython3 --classic --nosep --no-confirm-exit'
alias h='http --verify no'

if type jq > /dev/null 2>&1;then
    # psjon using jq
    alias pjson='jq .'
else
    # use good old python
    alias pjson='python -m json.tool'
fi

# git aliases
alias 'gitr'='git review -v'
#alias 'gits'='git status'
alias 'gitl'='git log --oneline'
alias 'gitll'='git log --name-status'
alias 'gitlg'='git log --oneline --graph --decorate --abbrev-commit --all'
alias 'gitl1'='git log -1'
alias 'gitd'='git diff'
alias 'gitdiff'='git diff'
alias 'gitdd'='git difftool'
alias 'gitc'='git config --list'
#alias 'gitb'='git branch'
alias 'gitp'='git pull --ff-only origin master'
alias 'gut'='git'
alias 'fit'='git'
alias 'gitw'='git worktree'

alias tmux='tmux -2'

# this is for devstack to run on LinuxMint
export FORCE=yes

# export GIT_BASE=https://git.openstack.org

# for stack user
#export XAUTHORITY=/home/ananta/.Xauthority

# for faster building of envs and pip installs
export PIP_DOWNLOAD_CACHE=~/.pip-cache/pip

findinfile ()
{
    if [ -z "$1" ];then
        echo -e "Search pattern missing.\n"
        exit
    fi

    #find . -type f -exec grep -iHn "$1" '{}' \;

    # ggrep -isrn --binary-files=without-match --exclude-dir=.git --exclude-dir=.tox --exclude-dir=.test* --exclude-from=$HOME/.gitignore -e "$1" .
    grep -isrn --binary-files=without-match --exclude-dir=.git --exclude-dir=.tox --exclude-dir=.test* --exclude-from=$HOME/.gitignore -e "$1" .
}

findpyfiles ()
{
    if [ -z "$1" ];then
        echo -e "Search pattern missing.\n"
        exit
    fi

    #find . -name "*.py" -type f -exec grep -iHn "$1" '{}' \;
    # ggrep -iIsrn --include=*.py --exclude-dir=.git --exclude-dir=.tox --exclude-dir=.test* --exclude-from=$HOME/.gitignore -e "$1" .
    grep -iIsrn --include=*.py --exclude-dir=.git --exclude-dir=.tox --exclude-dir=.test* --exclude-from=$HOME/.gitignore -e "$1" .
}

findgofiles ()
{
    if [ -z "$1" ];then
        echo -e "Search pattern missing.\n"
        exit
    fi

    #find . -name "*.go" -type f -exec grep -iHn "$1" '{}' \;
    ggrep -iIsrn --include=*.go --exclude-dir=.git --exclude-dir=.tox --exclude-dir=.test* --exclude-from=$HOME/.gitignore -e "$1" .
}

findlsfiles ()
{
    if [ -z "$1" ];then
        echo -e "Search pattern
missing.\n"
        exit
    fi

    #find . -type f -exec grep -il "$1" '{}' \;
    ggrep -ilsrIH --exclude-dir=.git --exclude-dir=.tox --exclude-dir=.test* --exclude-from=$HOME/.gitignore -e "$1" .
}

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# === MACOS related stuff ====
# git command autocompletion script
# For git completion in zsh, git-completion.bash is requited:
# Find doc: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
source ~/bin/git-completion.bash
# zstyle ':completion:*:*:git:*' script ~/bin/git-completion.zsh
#fpath=(~/.zsh $fpath)
source ~/bin/git-prompt.sh

# git commamands simplified
alias gits='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gitb='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias gcp='git cherry-pick'
alias gcpt='git cherry-pick --strategy=recursive -X theirs'

# ls alias for color-mode
#alias lh='ls -lhaG'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

alias hibernate='sudo pmset -a hibernatemode 25'
alias sleep='sudo pmset -a hibernatemode 0'
alias safesleep='sudo pmset -a hibernatemode 3'
alias smartsleep='sudo pmset -a hibernatemode 2'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# grep with color
alias grep='grep --color=auto'

# proxy tunnel
#alias proxy='ssh -D XXXX -p XXXX USER@DOMAIN'
# ssh home
#alias sshome='ssh -p XXXX USER@DOMAIN'

# processes
alias ps='ps -ax'

export PATH=$PATH:$HOME/bin    # May be redundant; check ~/.bash_profile, /etc/profile, /etc/paths, /etc/bashrc

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1

alias t='todo.sh -d ~/.todo/config'

# FOllowing needed for mtr to run
# You still need to run using sudo

# alias ose='source ~/work/avi-dev/avi-dev-venv/bin/activate && source ~/work/openstack-resources/admin-openrc-os-controller.sh'
alias ose='source ~/os-venv3/bin/activate && source ~/openrc-files/admin-openrc.sh'
alias os=openstack
# alias ossl='os server list --all-projects -c Name -c Status -c Networks'
alias ossl='os server list --all-projects --fit-width'
alias osss='os server show --fit-width'

alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no 2>/dev/null'

alias tm=tmux
alias t=tmux

export PYTHONHTTPSVERIFY=0
export PATH=$PATH:/opt/adminuser/.local/bin
export PATH=$PATH:/opt/adminuser/.fzf/bin
export FZF_DEFAULT_OPTS="--no-mouse --height 80% --reverse --multi --info=inline --preview='$HOME/.config/nvim/plugged/fzf.vim/bin/preview.sh {}' --preview-window='right:60%:wrap' --bind='f2:toggle-preview,f3:execute(bat --style=numbers {} || less -f {}),ctrl-o:execute($EDITOR {}),alt-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export MANPATH="/usr/local/share/fzf/man:$MANPATH"

alias less=bat
alias c1='ssh admin@controller1'
alias c2='ssh admin@controller2'

alias diff=colordiff
alias vi=nvim
alias vim=nvim

# Keep this as last option
# unsetopt share_history
. /mnt/builds/pr-builder/bash_sources/.bashrc-container
