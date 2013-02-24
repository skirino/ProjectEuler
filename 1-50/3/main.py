#!/usr/bin/env python

target = 600851475143
#target = 13195


largest_factor = 0
i = 3
while True:
    while target % i == 0:
        print i, target, target/i
        target /= i
        if largest_factor < i:
            largest_factor = i
    i += 2
    if i >= target:
        break

print max(largest_factor, target)
