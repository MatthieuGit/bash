# ---- Homebrew

export PATH="/opt/homebrew/bin:$PATH"
#export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
#export NODE_PATH="$HOME/.npm/lib/node_modules"
#export PATH="$PATH:$HOME/.npm/bin"

# ---- Prompt

autoload -Uz colors && colors

return_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="%{$fg[cyan]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[cyan]%}%m %{$reset_color%}%{$fg[yellow]%}%~$(return_git_branch) %{$reset_color%}% \$ "
