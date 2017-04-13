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

test_should_fizzbuzzify_on_a_list_of_numbers() {
    numbers=($(seq 1 15))
    out=`fizzbuzzifyOnList ${numbers[@]}`
    assertEquals "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz" "${out}"
}

oneTimeSetUp() {
    . ./src/fizzbuzz.sh
}

. ./lib/2.0/src/shell/shunit2
