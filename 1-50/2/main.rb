#!/usr/bin/env ruby

sum = 0
a, b = 1, 1
a, b = b, a+b
a, b = b, a+b

while a < 4000000
  sum += a
  a, b = b, a+b
  a, b = b, a+b
  a, b = b, a+b
end

p sum
