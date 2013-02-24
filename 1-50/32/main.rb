#!/usr/bin/env ruby

require_relative '../util'

ONE_TO_NINE = (1..9).to_a
$results = []

def f(i, j)
  k = i * j
  if "#{i}#{j}#{k}".each_char.map(&:to_i).sort == ONE_TO_NINE
    $results << [i, j, k]
  end
end

1.upto(9).each do |i|
  1234.upto(9876).each do |j|
    f(i, j)
  end
end

12.upto(98).each do |i|
  123.upto(987).each do |j|
    f(i, j)
  end
end

p $results
p $results.map(&:last).uniq.inject(:+)
