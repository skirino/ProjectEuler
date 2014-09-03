#!/usr/bin/env ruby

require_relative '../../lib/util'

def self_power(n)
  result = 1
  n.times { |i| result = (result * n) }
  result
end

p (1 .. 1000).map { |n| self_power(n) }.inject(:+) % (10 ** 10)
