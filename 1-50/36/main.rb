#!/usr/bin/env ruby

require_relative '../util'

def palindrome_in?(base, n)
  s = n.to_s(base)
  s == s.reverse
end

def palindrome_in_2_and_10?(n)
  palindrome_in?(2, n) && palindrome_in?(10, n)
end

results = 1.upto(999999).select { |n| palindrome_in_2_and_10?(n) }

p results
p results.inject(:+)
