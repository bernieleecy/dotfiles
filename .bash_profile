if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi
export LC_ALL=en_GB.UTF-8
# This version will work on OS X out of the box. Some twiddling is needed for my original version
git_branch() { 
    git symbolic-ref HEAD --short 2>/dev/null | sed -E 's/.+/ (&)/'
}

export EDITOR='vim'

# you can change the last number to change the colour.
# for a list of colours, run: 
#      curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
# (from https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal)
# Bernie's note: I've changed the colours except white and reset
# From lightcyan 45, lightgreen 40, lightyellow 178, orange 202, yelloworange 179
# brown 130, lightblue 75, darkblue 26
# Colours here are for use with the seoul256.vim theme
LIGHTCYAN='\[\033[38;5;9m\]' # for example, change '45' to '21' to make this darker.
WHITE='\[\033[38;5;15m\]'
LIGHTGREEN='\[\033[38;5;10m\]'
LIGHTYELLOW='\[\033[38;5;3m\]'
ORANGE='\[\033[38;5;12m\]'
RESET='\[$(tput sgr0)\]'

YELLOWORANGE='\[\033[38;5;13m\]'
BROWN='\[\033[38;5;14m\]'
LIGHTBLUE='\[\033[38;5;15m\]'
DARKBLUE='\[\033[38;5;26m\]'

export PS1="${LIGHTCYAN}\u${RESET}${WHITE}@${RESET}${LIGHTGREEN}\h:${RESET}${LIGHTYELLOW}\W${ORANGE}\$(git_branch)${RESET} ${LIGHTYELLOW}\$ ${RESET}"
export PATH="$HOME/bin:$PATH" 
export PATH=/Users/bernadettelee/bin/ADFR/bin:$PATH
export PATH="$HOME/git-latexdiff":$PATH

export CLICOLOR=1
export TERM=xterm-256color

aleph=kebl6219@aleph.chem.ox.ac.uk
alias cluster_aleph="ssh kebl6219@aleph.chem.ox.ac.uk"
alias folder_aleph="sshfs kebl6219@aleph.chem.ox.ac.uk:/u/fd/kebl6219/ ~/Documents/CC_Aleph"
alias exit_aleph="umount ~/Documents/CC_Aleph"
alias vmd="/Applications/VMD\ 1.9.4a51-x86_64-Rev9.app/Contents/MacOS/startup.command"
alias eln="cd ~/Documents/DPhil/ELN"
alias dphil='cd ~/Documents/DPhil'
alias otex="vim *.tex"
alias chemcraft='wine64 ~/Chemcraft_b574b_win64/Chemcraft.exe'
alias comp_previous='git latexdiff HEAD^ --biber --latexopt -shell-escape --ignore-latex-errors'

source /usr/local/gromacs/bin/GMXRC


# Alias for common GROMACS commands 
alias jcim_amber='export GMXLIB=~/Documents/DPhil/force_fields/top'
alias nvt_tpr="gmx grompp -f nvt.mdp -c ../3-min/em.gro -r ../3-min/em.gro -p ../0-top/topol.top -o nvt.tpr"
alias npt_tpr="gmx grompp -f npt.mdp -c ../4-nvt/nvt.gro -r ../4-nvt/nvt.gro -t ../4-nvt/nvt.cpt -p ../0-top/topol.top -o npt.tpr" 
alias md_tpr="gmx grompp -f md.mdp -c ../5-npt/*.gro -t ../5-npt/*.cpt -p ../0-top/topol.top -o md_1.tpr"
# Beware of md_tpr - may have to change the filename to e.g. md_2.tpr after running the command if necessary

#fzf related
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -I -t d . $HOME"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

