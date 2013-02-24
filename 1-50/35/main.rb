#!/usr/bin/env ruby

require_relative '../util'
require_relative '../prime'

def to_digits(n)
  n.to_s.each_char.map(&:to_i)
end

def all_rotations(n)
  digits = to_digits(n)
  ([n] + 1.upto(digits.size - 1).map do |i|
    (digits[i..-1] + digits[0..i-1]).map(&:to_s).inject(:<<).to_i
  end).uniq
end

results = [2, 3, 5, 7]

10.upto(999999).each do |n|
  next if results.include?(n)
  digits = to_digits(n)
  next unless (digits - [1, 3, 7, 9]).empty?
  ns = all_rotations(n)
  results += ns if ns.all? { |x| is_prime?(x) }
end

p results
p results.size
