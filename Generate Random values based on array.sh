#!/bin/bash

# Array of values
values=(3000 3500 5000 6000 7000 8000 10000 12000 14000 15000 24000)

# Get the length of the array
length=${#values[@]}

# Generate a random index
random_index=$((RANDOM % length))

# Get the random value
random_value=${values[random_index]}

# Display the random value
echo "Randomly selected value: $random_value"
