#!/bin/bash

# если память в корневой > 1гб
function checkSpace {
    [ $(df -m / | tail -n 1 | awk '{printf $4}') -gt 1000 ]
}
