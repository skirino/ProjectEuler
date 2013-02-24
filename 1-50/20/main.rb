#!/usr/bin/env ruby

p 1.upto(100).inject(:*).to_s.each_char.map(&:to_i).inject(:+)
