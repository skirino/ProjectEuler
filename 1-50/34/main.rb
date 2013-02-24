#!/usr/bin/env ruby

require_relative '../util'

results = []

def fact(n)
  1.upto(n).inject(:*) || 1
end
$facts_table = 0.upto(9).map { |n| fact(n) }

10.upto($facts_table[9] * 7).each do |i|
  results << i if i == i.to_s.each_char.map(&:to_i).map { |n| $facts_table[n] }.inject(:+)
end

p results.inject(:+)
