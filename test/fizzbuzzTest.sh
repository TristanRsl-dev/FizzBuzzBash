#!/bin/bash

test_should_return_number() {
    out=`fizzbuzzify 1`
    assertEquals "1" "${out}"
}

test_should_return_fizz() {
    out=`fizzbuzzify 3`
    assertEquals "Fizz" "${out}"
}

test_should_return_Buzz() {
    out=`fizzbuzzify 5`
    assertEquals "Buzz" "${out}"
}

oneTimeSetUp() {
    . ./src/fizzbuzz.sh
}

. /home/tristan/Downloads/shunit2-master/source/2.0/src/shell/shunit2

