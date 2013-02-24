#!/usr/bin/env python

# 1901 1 1 : Wednesday

num_sundays_on_1st = 0
months_normal = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months_leap   = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def process_year(year, day):
    months = year % 4 and months_normal or months_leap
    for month in months:
        if day == 0:
            num_sundays_on_1st += 1
        day = (month + day) % 7
    return day

day = 3
for year in (1901, 2001):
    process_year(year, day)

print num_sundays_on_1st
