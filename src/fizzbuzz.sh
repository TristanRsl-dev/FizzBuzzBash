#!/bin/bash

fizzbuzz() {
    case $1 in
        +([0-9]))
        numbers=($@)
        fizzbuzzifyOnList ${numbers[@]}
        return
        ;;
        --from | -f)
        case $2 in
            +([0-9]))
            case $3 in
                --to | -t)
                case $4 in
                    +([0-9]))
                    numbers=($(seq $2 $4))
                    fizzbuzzifyOnList ${numbers[@]}
                    return
                    ;;
                esac
                ;;
            esac
            ;;
        esac
        ;;
        --to | -t)
        case $2 in
            +([0-9]))
            numbers=($(seq 1 $2))
            fizzbuzzifyOnList ${numbers[@]}
            return
            ;;
        esac
        ;;
        * | --help | -h)
        displayHelp
        return
        ;;
    esac
    displayHelp
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
