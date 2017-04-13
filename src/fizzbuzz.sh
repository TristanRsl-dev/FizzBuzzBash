#!/bin/bash

fizzbuzz() {
    for argument in "$@"; do
        shift
        case "$argument" in
            "--help")
                set -- "$@" "-h"
                ;;
            "--from")
                set -- "$@" "-f"
                ;;
            "--to")
                set -- "$@" "-t"
                ;;
            *)
                set -- "$@" "$argument"
                ;;
        esac
    done

    while getopts "hf:t:" option; do
        case "$option" in
            f)
                from=$OPTARG
                ;;
            t)
                if [ "$from" == "" ]; then
                    from=1
                fi
                to=$OPTARG
                ;;
            h)
                displayHelp
                exit 0
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
        esac
    done

    if [ "$from" == "" ] && [ "$to" == "" ]; then
        numbers=("${@}")
    elif [ "$to" == "" ]; then
        displayError "The '--from | -f' command need to be follow by the '--to | -t'"
        exit 2
    else
        numbers=($(seq $from $to))
    fi

    if [ ${#numbers[@]} == 0 ]; then
        displayHelp
        exit 3
    else
        fizzbuzzifyOnList "${numbers[@]}"
    fi
}

fizzbuzzify() {
    if (($1 % 3 == 0)) && (($1 % 5 == 0)); then
        echo "FizzBuzz"
    elif (($1 % 3 == 0)); then
        echo "Fizz"
    elif (($1 % 5 == 0)); then
        echo "Buzz"
        else echo "$1"
    fi
}

fizzbuzzifyOnList() {
    numbers=("${@}")
    out=""
    for index in ${numbers[@]}
    do
        out="$out`fizzbuzzify $index` "
    done
    echo ${out}
}

displayHelp() {
    echo "fizzbuzz.sh -- Fizzbuzzify one or more integers, or a range of integers"
    echo "  fizzbuzz <number>..."
    echo "  fizzbuzz [OPTIONS]"
    echo ""
    echo "  -f, --from START"
    echo "      Fizzbuzzify a range begginning at the START value."
    echo "      This option must be used with the '--to' option."
    echo "      Optional. If the END parameter is given, START is valued at 1 by default."
    echo "  -h, --help"
    echo "      Display the help."
    echo "  -t, --to END"
    echo "      Fizzbuzzify a range ending at the END value."
    echo "      This option may be used with the '--from' option."
    echo "      Conditional. This option is required if the '--from' option is used."
 
}

displayError() {
    echo "Invalid command: $1"
}

fizzbuzz $@
