#!/usr/bin/env python

class Decomposition:
    def __init__(self, n):
        self.d = {}
        i=2
        n = self.divide_completely(n, i)
        i=3
        while n != 1:
            n = self.divide_completely(n, i)
            while n%i == 0:
                n /= i
            i += 2
    
    def divide_completely(self, target, i):
        while target % i == 0:
            target /= i
            self.inc(i)
        return target
    
    def inc(self, key):
        if key in self.d:
            self.d[key] += 1
        else:
            self.d[key] = 1
    
    def add(self, dec):
        ret = Decomposition(1)
        retd = {}
        for key in self.d.keys():
            retd[key] = self.d[key]
        for key in dec.d.keys():
            if key in retd:
                retd[key] += dec.d[key]
            else:
                retd[key] = dec.d[key]
        ret.d = retd
        return ret

    def num_divisors(self):
        ret = 1
        for key in self.d.keys():
            ret *= self.d[key]+1
        return ret

i = 2
while True:
    if i % 2 == 0:
        x = Decomposition(i/2).add(Decomposition(i+1)).num_divisors()
    else:
        x = Decomposition(i).add(Decomposition((i+1)/2)).num_divisors()
    if x > 500:
        print 'end ', i, x, i*(i+1)/2
        break
    i += 1
