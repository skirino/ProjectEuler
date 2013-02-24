#!/usr/bin/env python

# 9ab * 9cd = 9effe9

for a in range(900, 1000):
    for b in range(900, 1000):
        for e in range(0, 10):
            for f in range(0, 10):
                num = 900009 + 10010*e + 1100*f
                if num == a * b:
                    print 'found!  %d = %d * %d' % (num, a, b)
