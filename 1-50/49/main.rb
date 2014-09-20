#!/usr/bin/env ruby

require 'mathn'
require_relative '../../lib/util'

primes = (1000 .. 9999).select(&:prime?)
prime_sets = primes.group_by { |p| p.to_s.each_char.sort.join.to_i }.map { |_, v| v }.select { |a| a.size >= 3 }
p prime_sets.map { |set| set.combination(3).select { |a, b, c| b - a == c - b } }.reject(&:empty?)
