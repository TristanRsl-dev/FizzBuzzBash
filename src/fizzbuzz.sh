#!/bin/bash

fizzbuzzify() {
    if !(($1 % 3))
        then echo "Fizz"
    elif !(($1 % 5))
        then echo "Buzz"
        else echo "$1"
    fi
}
