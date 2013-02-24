#!/usr/bin/env ruby

require 'json'

ORD_BASE = 'A'.ord - 1

def name_score(name)
  name.each_char.map { |c| c.ord - ORD_BASE }.inject(:+)
end

names = JSON.parse('[' + File.read('./names.txt') + ']').sort
p names.map.with_index(1) { |name, i| name_score(name) * i }.inject(:+)
