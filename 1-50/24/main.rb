#!/usr/bin/env ruby

require_relative '../util'

def fact(n)
  1.upto(n).inject(:*) || 1
end

def determine_digits(results, ary, remaining)
  return results if ary.empty?
  f = fact(ary.size - 1)
  i = remaining / f
  new_results   = results << ary.delete_at(i)
  new_remaining = remaining - f * i
  determine_digits(new_results, ary, new_remaining)
end

a = 0.upto(9).to_a
p determine_digits([], a, 1000000-1).map(&:to_s).inject(:+)
