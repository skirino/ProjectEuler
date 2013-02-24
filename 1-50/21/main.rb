#!/usr/bin/env ruby

def sum_of_divisors(i)
  1.upto(i/2).select { |j| i % j == 0 }.inject(:+) || 0
end

mapping = 1.upto(25320).inject({}) { |h, i| h[i] = sum_of_divisors(i); h }
p mapping.select { |k, v| k <= 10000 }.values.max
amicable_pairs = mapping.select { |k, v| k != v && mapping[v] == k }
p amicable_pairs
p amicable_pairs.select { |k, v| k <= 10000 }.keys.inject(:+)
