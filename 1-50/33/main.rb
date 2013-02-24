#!/usr/bin/env ruby

require_relative '../util'

results = []

def curious_fraction?(n, d)
  digits_n = n.to_s.each_char.map(&:to_i)
  digits_d = d.to_s.each_char.map(&:to_i)
  common_char = digits_n & digits_d
  return false if common_char.size != 1

  x = common_char[0]
  return false if x == 0
  n_remained = (digits_n - [x])[0] || x
  d_remained = (digits_d - [x])[0] || x
  n_remained * d == d_remained * n
end

10.upto(98).each do |n|
  (n+1).upto(99).each do |d|
    if curious_fraction?(n, d)
      results << [n, d]
    end
  end
end

p results.inject(Rational(1, 1)) { |r, (n, d)| r * Rational(n, d) }
