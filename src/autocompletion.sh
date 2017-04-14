#!/bin/bash

_fizzbuzz() {
    local current="${COMP_WORDS[COMP_CWORD]}" \
        previous="${COMP_WORDS[COMP_CWORD-1]}" \
        options="--from -f --to -t --help -h"

    case "${previous}" in
        --from | -f | --to | -t)
            return
        ;;
    esac

    if [[ "${COMP_WORDS[*]}" =~ ^.*(-f|--from).*$ ]]; then
        options=$(echo ${options} | sed -e 's/-f\|--from\|-h\|--help//g')
    fi

    if [[ "${COMP_WORDS[*]}" =~ ^.*(-t|--to).*$ ]]; then
        options=$(echo ${options} | sed -e 's/-t\|--to\|-h\|--help//g')
    fi

    COMPREPLY=($(compgen -W "$options" -- ${current}))
}

complete -F _fizzbuzz fizzbuzz.sh
