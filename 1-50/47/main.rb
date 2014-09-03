#!/usr/bin/env ruby

require 'mathn'
require_relative '../../lib/util'

answer = (1 .. 1000000).each_cons(4).find do |a| 
  a.all? { |n| n.prime_division.size == 4 }
end
p answer
