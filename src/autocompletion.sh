#!/bin/bash

autocomplete() {
    local current previous options
    COMPREPLY=()
    current="${COMP_WORDS[COMP_CWORD]}"
    previous="${COMP_WORDS[COMP_CWORD-1]}"
    options=("--from" "-f" "--to" "-t" "--help" "-h")

    case "${previous}" in
        --from | -f | --to | -t)
            return
        ;;
    esac

    if [[ "${COMP_WORDS[*]}" == *"-f"* ]] || [[ "${COMP_WORDS[*]}" == *"--from"* ]]; then
        unset options[0]
        unset options[1]
    fi

    if [[ "${COMP_WORDS[*]}" == *"-t"* ]] || [[ "${COMP_WORDS[*]}" == *"--to"* ]]; then
        unset options[2]
        unset options[3]
    fi

    COMPREPLY=($(compgen -W "${options[*]}" -- ${current}))
}

complete -F autocomplete ./src/fizzbuzz.sh
