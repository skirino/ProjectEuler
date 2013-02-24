#!/usr/bin/env ruby

require_relative '../util'

def sum_of_divisors(i)
  1.upto(i/2).select { |j| i % j == 0 }.inject(:+) || 0
end

def expressed_as_a_sum_of_abundant_numbers?(n, as)
  i = 0
  j = as.size - 1
  while i <= j do
    sum = as[i] + as[j]
    return true if n == sum
    if n < sum
      j -= 1
    else
      i += 1
    end
  end
  false
end

abundant_numbers = savepoint('abundant_numbers') do
  1.upto(28123).select { |i| i < sum_of_divisors(i) }
end
p 1.upto(28123).reject { |n| expressed_as_a_sum_of_abundant_numbers?(n, abundant_numbers) }.inject(:+)
