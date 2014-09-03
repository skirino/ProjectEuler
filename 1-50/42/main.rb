#!/usr/bin/env ruby

require 'json'
require_relative '../../lib/util'

def is_triangle_number?(n)
  det = 1 + 8 * n
  sqrt = det ** 0.5
  sqrt.round ** 2 == det
end

ORD_A = 'A'.ord
def is_triangle_word?(word)
  n = word.chars.map { |c| c.ord - ORD_A + 1 }.inject(:+)
  is_triangle_number?(n)
end

words = JSON.parse(File.read('words.json'))
answer = words.select { |w| is_triangle_word?(w) }.size

p 'Result: ', answer
