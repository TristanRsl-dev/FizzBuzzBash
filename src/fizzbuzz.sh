#!/bin/bash

fizzbuzzify() {
    if !(($1 % 3)) && !(($1 % 5))
        then echo "FizzBuzz"
    elif !(($1 % 3))
        then echo "Fizz"
    elif !(($1 % 5))
        then echo "Buzz"
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
