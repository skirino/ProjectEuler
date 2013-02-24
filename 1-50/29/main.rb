#!/usr/bin/env ruby

require_relative '../util'

require 'set'
s = Set.new

2.upto(100).each do |a|
  2.upto(100).each do |b|
    s.add(a ** b)
  end
end

p s.size
