# set default options for less
export LESS="${LESS} -R --mouse"

# set colors, i.e. for man pages
autoload -U colors && colors
export LESS_TERMCAP_mb="${fg_bold[red]}"
export LESS_TERMCAP_md="${fg_bold[red]}"
export LESS_TERMCAP_me="${reset_color}"
export LESS_TERMCAP_so="${fg_bold[yellow]}${fg_bold[blue]}"
export LESS_TERMCAP_se="${reset_color}"
export LESS_TERMCAP_us="${fg_bold[green]}"
export LESS_TERMCAP_ue="${reset_color}"
