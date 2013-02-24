#!/usr/bin/env ruby

require_relative '../util'

f = ->(n) do
  n == n.to_s.each_char.map(&:to_i).map { |i| i**5 }.inject(:+)
end

p 2.upto(999999).select(&f).inject(:+)
