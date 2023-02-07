#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jul 16 00:39:16 2022

@author: madeline
"""
#W12 Q2: Radix sort
def count_sort(input_array):
    max_el = max(input_array)

    count_array_length = max_el+1

    # Initialize the count_array with (max+1) zeros
    count_array = [0] * count_array_length

    # Step 1: Traverse the input_array and increase 
    # the corresponding count for every element by 1
    for el in input_array: 
        count_array[el] += 1

    # Step 2: For each element in the count_array, 
    # sum up its value with the value of the previous 
    # element, and then store that value 
    # as the value of the current element
    for i in range(1, count_array_length):
        count_array[i] += count_array[i-1] 

    # Step 3: Calculate element position
    # based on the count_array values
    output_array = [0] * len(input_array)
    i = len(input_array) - 1
    while i >= 0:
        current_el = input_array[i]
        count_array[current_el] -= 1
        new_position = count_array[current_el]
        output_array[new_position] = current_el
        i -= 1

    return output_array

import numpy as np

#randomly generate 1,000,000 integers
input_array = np.random.randint(1,1000001,1000000)
print("Input Array is ", input_array)

sorted_array = count_sort(input_array)
print("Counting Sort Result is ", sorted_array)

