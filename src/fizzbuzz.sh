#!/bin/bash

fizzbuzz() {
    for argument in "${@}"; do
        shift
        case "${argument}" in
            "--help")
                set -- "${@}" "-h"
                ;;
            "--from")
                set -- "${@}" "-f"
               ;;
            "--to")
                set -- "${@}" "-t"
                ;;
            *)
                set -- "${@}" "${argument}"
                ;;
        esac
    done

    while getopts "hf:t:" option; do
        case "${option}" in
            f)
                from="${OPTARG}"
                ;;
            t)
                if [ -z "${from}" ]; then
                    from=1
                fi
                to="${OPTARG}"
                ;;
            h)
                displayHelp
                exit 0
                ;;
            \?)
                echo "Invalid option: -"${OPTARG}"" >&2
                exit 1
                ;;
        esac
    done

    if [ -z "$from" ] && [ -z "$to" ]; then
        numbers=("${arguments}")
    elif [ -z "$to" ]; then
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
    local number="$1"

    if ((${number} % 3 == 0)) && ((${number} % 5 == 0)); then
        echo "FizzBuzz"
    elif ((${number} % 3 == 0)); then
        echo "Fizz"
    elif ((${number} % 5 == 0)); then
        echo "Buzz"
        else echo "${number}"
    fi
}

fizzbuzzifyOnList() {
    local numbers=("${@}")
    local out=""
    for index in "${numbers[@]}"
    do
        out="$out`fizzbuzzify $index` "
    done
    echo "${out}"
}

displayHelp() {
    local scriptname=`basename "$0"`
    echo -e "${scriptname} -- Fizzbuzzify one or more integers, or a range of integers\n" \
    "\t${scriptname} <number>...\n" \
    "\t${scriptname} [OPTIONS]\n" \
    "\n" \
    "\t-f, --from START\n" \
    "\t\tFizzbuzzify a range begginning at the START value.\n" \
    "\t\tThis option must be used with the '--to' option.\n" \
    "\t\tOptional. If the END parameter is given, START is valued at 1 by default.\n" \
    "\t-h, --help\n" \
    "\t\tDisplay the help.\n" \
    "\t-t, --to END\n" \
    "\t\tFizzbuzzify a range ending at the END value.\n" \
    "\t\tThis option may be used with the '--from' option.\n" \
    "\t\tConditional. This option is required if the '--from' option is used."
 
}

displayError() {
    echo "Invalid command: $1"
}

fizzbuzz $@
