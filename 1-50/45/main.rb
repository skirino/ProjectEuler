#!/usr/bin/env ruby

require_relative '../../lib/util'

def pentagonal_number(n)
  n * (3 * n - 1) / 2
end

def hexagonal_number(n)
  n * (2 * n - 1)
end

def is_hexagonal_number?(n)
  x = (0.25 * (1 + (1 + 8 * n) ** 0.5)).round
  n == hexagonal_number(x)
end

answer = (166 .. 100000).map { |n| pentagonal_number(n) }.find { |n| is_hexagonal_number?(n) }
p 'Result: ', answer
