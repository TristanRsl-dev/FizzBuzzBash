#!/bin/bash

fizzbuzz() {
    case $1 in
        +([0-9]))
        fizzbuzzify $1
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
                    ;;
                esac
                ;;
            esac
            ;;
        esac
        ;;
        --help | -h)
        echo "You ask for the help prompt"
        ;;
    esac
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
    numbers="${!1}"
    out=""
    for index in ${numbers[@]}
    do
        out="$out`fizzbuzzify $index` "
    done
    echo ${out}
}
