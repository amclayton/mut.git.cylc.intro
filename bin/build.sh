#!/bin/bash
# This program pretends to build the model.

function main {
    local sleepfor="${1}"
    local sleeptimes="${2}"
    monte_christo=1
    while [[ monte_christo -lt "${sleeptimes}" ]]; do
        echo "monte_christo is ${monte_christo}"
        sleep "${sleepfor}"
        ((monte_christo += 1))
    done
}

main 1 10
