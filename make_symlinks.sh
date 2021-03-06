#!/usr/bin/env bash
files=(".vimrc" \
    ".vim" \
    ".bash_profile" \
    ".gitconfig" \
    ".tmux.conf" \
    ".bashrc" \
    ".config" \
    ".pymolrc" \
    ".vmdrc" \
    ".git-completion.bash" \
)
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
for f in ${files[@]}; do
    if [[ -L ${HOME}/${f} ]] || [[ ! -a ${HOME}/${f} ]] ; then
        rm ${HOME}/${f} 2&>/dev/null
        ln -s ${DOTFILES}/${f} ${HOME}/${f}
    else
        printf "non-symlink file was detected:   %s\n" ${f}
    fi
done
