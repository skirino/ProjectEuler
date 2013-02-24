#!/usr/bin/env python

import sys

def p_num(i):
    return i*(3*i-1)/2

def check_if_p(x):
    root = (1 + (1.0 + 24*x)**0.5)/6
    return (p_num(int(root)) == x or
            p_num(int(root+1)) == x)


if __name__ == '__main__':
    i = 1
    while True:
        pntarget = p_num(i)
        ismall = 1
        ilarge = i+1
        
        while True:
            pnlarge = p_num(ilarge)
            pnsmall = p_num(ismall)
            diff = pnlarge - pnsmall
            if diff == pntarget:
                if check_if_p(pnlarge + pnsmall):
                    print 'congratulations! the answer is', diff
                    sys.exit
                else:
                    ismall += 1
                    ilarge += 1
            elif diff < pntarget:
                ilarge += 1
            else: # diff > pntarget
                ismall += 1
            
            if ismall == ilarge:
                break
        
        print 'calculating ... ', i, pntarget
        i += 1
