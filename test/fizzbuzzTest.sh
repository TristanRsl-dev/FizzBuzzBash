#!/bin/bash

test_should_return_number() {
    out=`fizzbuzzify 1`
    assertEquals "1" "${out}"
}

test_should_return_fizz() {
    out=`fizzbuzzify 3`
    assertEquals "Fizz" "${out}"
}

test_should_return_buzz() {
    out=`fizzbuzzify 5`
    assertEquals "Buzz" "${out}"
}

test_should_return_fizzbuzz() {
    out=`fizzbuzzify 15`
    assertEquals "FizzBuzz" "${out}"
}

oneTimeSetUp() {
    . ./src/fizzbuzz.sh
}

. /home/tristan/Downloads/shunit2-master/source/2.0/src/shell/shunit2

