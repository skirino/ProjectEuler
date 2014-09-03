#!/usr/bin/env ruby

require_relative '../../lib/util'

def gen_candidate_xs(p, &block)
  stop_x = ((1 - 0.5 * 2.0**0.5) * p).floor
  (1 .. stop_x)
end

def has_correct_triplet?(x, p)
  (p * p) % (p - x) == 0
end

evens = (1 .. 500).map { |n| 2 * n }
answer = evens.max_by { |p| gen_candidate_xs(p).select { |x| has_correct_triplet?(x, p) }.size }

p 'Result: ', answer
