#!/usr/bin/env ruby

require_relative '../../lib/util'

digits_upto = {}
digits_upto[     1] = 1
digits_upto[    10] = 2 * 10 - 9
digits_upto[   100] = 3 * 100 - 99 - 9
digits_upto[  1000] = 4 * 1000 - 999 - 99 - 9
digits_upto[ 10000] = 5 * 10000 - 9999 - 999 - 99 - 9
digits_upto[100000] = 6 * 100000 - 99999 - 9999 - 999 - 99 - 9
DIGITS_UPTO = digits_upto

def calc_d(n)
  base = n / 10
  remainder = n - DIGITS_UPTO[base]
  target_number = remainder / base.to_s.size + base + 1
  index         = remainder % base.to_s.size - 1
  target_number.to_s[index].to_i
end

answer = [10, 100, 1000, 10000, 100000, 1000000].map { |n| calc_d(n) }.inject(:*)

p 'Result: ', answer
