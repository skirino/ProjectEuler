#!/usr/bin/env ruby

require_relative '../util'

fib1 = 1
fib2 = 1
index = 2

loop do
  index += 1
  fib1, fib2 = fib2, fib1 + fib2
  break if fib2.to_s.size >= 1000
end

p index
