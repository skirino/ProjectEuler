#!/usr/bin/env ruby

require_relative '../util'
require_relative '../prime'

class Quadratic
  def initialize(a, b)
    @a = a
    @b = b
  end

  def value(n)
    n*n + @a*n + @b
  end

  def num_consecutive_primes
    n = 0
    while is_prime?(value(n))
      n += 1
    end
    n
  end
end

a_max = 0
b_max = 0
max = 0

(-999 .. 999).each do |a|
  (-999 .. 999).each do |b|
    begin
      num_primes = Quadratic.new(a, b).num_consecutive_primes
      if max < num_primes
        a_max = a
        b_max = b
        max = num_primes
      end
    rescue
    end
  end
end

puts "a=#{a_max} b=#{b_max} max=#{max} result=#{a_max*b_max}"
