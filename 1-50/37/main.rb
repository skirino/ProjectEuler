#!/usr/bin/env ruby

require_relative '../util'
require_relative '../prime'

LEFTMOST_DIGIT  = [3, 5, 7]
RIGHTMOST_DIGIT = [3, 7]
INNER_DIGIT     = [1, 3, 7, 9]

def to_digits(n)
  n.to_s.each_char.map(&:to_i)
end
def to_number(digits)
  digits.map(&:to_s).inject(:<<).to_i
end

def left_truncated_numbers(digits)
  1.upto(digits.size - 1).map { |i| to_number(digits[i .. -1]) }
end
def right_truncated_numbers(digits)
  1.upto(digits.size - 1).map { |i| to_number(digits[0 .. -1-i]) }
end

def is_left_truncatable_prime?(n, digits)
  (left_truncated_numbers(digits)  + [n]).all? { |x| x == 1 || is_prime?(x) }
end
def is_right_truncatable_prime?(n, digits)
  (right_truncated_numbers(digits) + [n]).all? { |x| x == 1 || is_prime?(x) }
end

def extract_truncatable_primes(left_truncatable_primes, right_truncatable_primes)
  (left_truncatable_primes & right_truncatable_primes).reject do |n|
    digits = to_digits(n)
    digits[0] == 1 || digits[-1] == 1
  end
end

#2-digits
left_truncatable_primes2  = []
right_truncatable_primes2 = []
[1, 2, 3, 5, 7, 9].each do |n1|
  [1, 3, 5, 7, 9].each do |n2|
    digits = [n1, n2]
    n = to_number(digits)
    left_truncatable_primes2  << n if is_left_truncatable_prime?(n, digits)
    right_truncatable_primes2 << n if is_right_truncatable_prime?(n, digits)
  end
end

truncatable_primes = extract_truncatable_primes(left_truncatable_primes2, right_truncatable_primes2)
p truncatable_primes


left_truncatable_primes_old = left_truncatable_primes2
left_truncatable_primes_new = []
right_truncatable_primes_old = right_truncatable_primes2
right_truncatable_primes_new = []

3.upto(6).each do |i|
  left_truncatable_primes_old.each do |l|
    [1, 3, 5, 7, 9].each do |d|
      n = "#{d}#{l}".to_i
      left_truncatable_primes_new << n if is_prime?(n)
    end
  end

  right_truncatable_primes_old.each do |r|
    [1, 3, 5, 7, 9].each do |d|
      n = "#{r}#{d}".to_i
      right_truncatable_primes_new << n if is_prime?(n)
    end
  end

  truncatable_primes += extract_truncatable_primes(left_truncatable_primes_new, right_truncatable_primes_new)
  p i, truncatable_primes

  left_truncatable_primes_old = left_truncatable_primes_new
  left_truncatable_primes_new = []
  right_truncatable_primes_old = right_truncatable_primes_new
  right_truncatable_primes_new = []
end

p truncatable_primes.size
p truncatable_primes.inject(:+)
