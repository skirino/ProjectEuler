#!/usr/bin/env ruby

require 'mathn'
require_relative '../../lib/util'

def f(primes, n)
  primes.each_cons(n).map { |a| a.inject(:+) }.find { |p| p < 1000000 && p.prime? }
end

ns = (250 .. 500).map { |n| 2 * n + 1 }
primes = (1 .. 5000).select(&:prime?)
p ns.map { |n| f(primes, n) }
