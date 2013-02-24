#!/usr/bin/env ruby

require_relative '../util.rb'

def result(n)
  (16*n*n*n + 30*n*n + 26*n) / 3 + 1
end

p result(500)
