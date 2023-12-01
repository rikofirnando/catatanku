#!/bin/bash

# Set the range
start=100
end=10000

# Generate a random value within the range
random_value=$((RANDOM % (end - start + 1) + start))

# Display the random value
echo "Randomly selected value: $random_value"
