#!/usr/bin/env python

primes = [2, 3, 5, 7, 11, 13]

def is_prime(n):
    for p in primes:
        if n % p == 0:
            return False
    return True

while len(primes) <= 10001:
    candidate = primes[-1]+2
    while True:
        if is_prime(candidate):
            primes.append(candidate)
            break
        else:
            candidate += 2

print primes
