#!/bin/bash

fizzbuzzify() {
    if !(($1 % 3))
        then echo "Fizz"
        else echo "$1"
    fi
}
