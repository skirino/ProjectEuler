#!/usr/bin/env python

numbers = {1: 'one',
           2: 'two',
           3: 'three',
           4: 'four',
           5: 'five',
           6: 'six',
           7: 'seven',
           8: 'eight',
           9: 'nine',
           10: 'ten',
           11: 'eleven',
           12: 'twelve',
           13: 'thirteen',
           14: 'fourteen',
           15: 'fifteen',
           16: 'sixteen',
           17: 'seventeen',
           18: 'eighteen',
           19: 'nineteen',
           20: 'twenty',
           30: 'thirty',
           40: 'forty',
           50: 'fifty',
           60: 'sixty',
           70: 'seventy',
           80: 'eighty',
           90: 'ninety',
           100: 'onehundred',
           1000: 'onethousand'}

def num_letters(n):
    if n in numbers:
        s = numbers[n]
    else:
        digit100 = i / 100
        below100 = i % 100
        s = ""
        
        if digit100 > 0:
            s += numbers[digit100] + 'hundred'
            if below100 > 0:
                s += 'and'
        
        if below100 > 0:
            if below100 in numbers:
                s += numbers[below100]
            else:
                below10 = below100 % 10
                digit10 = below100 - below10
                if digit10 > 0:
                    s += numbers[digit10]
                if below10 > 0:
                    s += numbers[below10]
    return s


sum_letters = 0
for i in range(1, 1001):
    s = num_letters(i)
    print i, s
    sum_letters += len(s)

print sum_letters
