source "${CLINC_PATH}"/.bash_aliases

# Git config
git config --global core.editor "vim"
git config --global user.name "Eric Uriostigue"
git config --global user.email "eric@akewli.com"
git config --global credential.helper cache


export TERM=xterm-256color
export CLICOLOR=1

#alias python="python3.6"
#alias py="python3.6"
alias get-setup="git clone https://github.com/euriostigue/setup.git"


alias gca="git commit --amend --no-edit"
alias gdm="git diff origin/master"
alias gdw="git diff --word-diff-regex=."
alias gco="git checkout"
alias gcom="git checkout origin/master"
alias grc="git reset --hard; git clean -xdf"
alias gb="git branch"
alias watch_io="python -m pyinotify -r -v /tmp/clinc-persist/default/persist/files/"

alias ll='ls -la'

color_prompt=yes
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
eval "dircolors ~/.dircolors" > /dev/null

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;34m\]\u@\h - [\d \@] - [\w]\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


function findstring(){
    grep -irn --include="*.$1" "${@:2}" . -C 5
}

function findexact(){
    grep -rn --include="*.$1" "${@:2}" . -C 5
}

function findpy(){
    grep -i -r --include="*.py" $1 .
}

function delete_file_types(){
    sudo find . -name "*.$1" -type f -delete
}

function findfile(){
    find . -name $1
}

function sub(){
    grep -rl --exclude-dir=.git "${1}" . | xargs sed -i "s/${1}/${2}/g"
}

function prod-certs(){
    docker run -it --rm -p 443:443 -p 80:80 --name letsencrypt \
        -v "/etc/letsencrypt:/etc/letsencrypt"  \
        -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
        quay.io/letsencrypt/letsencrypt:latest auth
}
