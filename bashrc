# Check if we're already inside a tmux session
if [ -z "$TMUX" ]; then
    # Create or attach to a default session
    tmux attach-session -t default || tmux new-session -s default
fi

alias ll='ls --color=auto -alF'
function cd() { builtin cd "$@" && ls -l --color=auto; }

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'; }

hostname_if_ssh() 
{
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo "[$USER@$(hostname)] "
    fi
}

export PS1='$(hostname_if_ssh)\w \[\e[32m\]$(parse_git_branch)\[\e[0m\]\n$ '

export PATH="$PATH:/opt/nvim-linux64/bin"