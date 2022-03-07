# ---- Prompt

autoload -U colors && colors
PS1="%{$fg[cyan]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[cyan]%}%m %{$reset_color%}%{$fg[yellow]%}%~ %{$reset_color%}% $ "