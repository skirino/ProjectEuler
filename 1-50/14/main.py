#!/usr/bin/env python

def collatz(n):
    if n%2 == 0:
        return n/2
    else:
        return 3*n+1

collatz_nums = {1:0}
def collatz_steps(n):
    if n in collatz_nums:
        ret = collatz_nums[n]
    else:
        next = collatz(n)
        ret = collatz_steps(next)+1
        collatz_nums[n] = ret
    return ret

max_num = 1
max_i = 0
i = 1

while True:
    num = collatz_steps(i)
    if max_num < num:
        max_num = num
        max_i = i
        print max_i, max_num
    i += 1
    if i >= 1000000:
        break

print 'end', max_num, max_i

