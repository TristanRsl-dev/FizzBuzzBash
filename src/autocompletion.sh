#!/bin/bash

autocomplete() {
    local current previous options
    COMPREPLY=()
    current="${COMP_WORDS[COMP_CWORD]}"
    previous="${COMP_WORDS[COMP_CWORD-1]}"
    options="--help --from --to -h -f -t"

    case "${previous}" in
        --from | -f | --to | -t)
            return
        ;;
    esac

    COMPREPLY=($(compgen -W "${options}" -- ${current}))
}

complete -F autocomplete ./src/fizzbuzz.sh
