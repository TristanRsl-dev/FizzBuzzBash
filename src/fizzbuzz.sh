#!/bin/bash

fizzbuzz() {
    for arguments in "$@"
    do
        case $arguments in
            +([0-9]))
            fizzbuzzify ${arguments}
            ;;
            --help | -h)
            echo "You ask for the help prompt"
            ;;
        esac
    done
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
