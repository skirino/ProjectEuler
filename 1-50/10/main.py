#!/usr/bin/env python

primes = [2, 3, 5, 7, 11, 13]

def is_prime(n):
    for p in primes:
        if n % p == 0:
            return False
    return True

max_prime_found = 13
while max_prime_found < 2000000:
    candidate = max_prime_found+2
    while True:
        if is_prime(candidate):
            primes.append(candidate)
            max_prime_found = candidate
            print 'new prime: ', max_prime_found
            break
        else:
            candidate += 2

sum = 0
for p in primes:
    sum += p
print sum

