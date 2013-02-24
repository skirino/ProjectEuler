#!/usr/bin/env python

def sum_every_digit(n):
    sum = 0
    while n > 0:
        sum += (n % 10)
        n /= 10
    return sum


max_sum = 0
max_a = 0
max_b = 0

for a in range(1, 100):
    for b in range(1, 100):
        sum = sum_every_digit(a**b)
        if max_sum < sum:
            max_sum = sum
            max_a = a
            max_b = b

print "%d ** %d = %d" % (max_a, max_b, max_sum)

