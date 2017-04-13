#!/bin/bash

autocomplete() {
    local current previous options
    COMPREPLY=()
    current="${COMP_WORDS[COMP_CWORD]}"
    previous="${COMP_WORDS[COMP_CWORD-1]}"
    options="--help --from --to -h -f -t"

    if [[ ${current} == -* ]]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current}))
        return 0
    fi
}

complete -F autocomplete ./src/fizzbuzz.sh
