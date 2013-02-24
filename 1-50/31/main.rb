#!/usr/bin/env ruby

require_relative '../util'

def f(coins, remaining)
  return [[remaining]] if coins.empty?
  cs = coins.dup
  c = cs.shift
  0.upto(remaining / c).to_a.reverse
    .map { |n| f(cs, remaining - c*n).map { |e| e.unshift(n) } }
    .flatten(1)
end

p f([200, 100, 50, 20, 10, 5, 2], 200).size
