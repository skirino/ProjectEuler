#!/usr/bin/env ruby

puts(1901.upto(2000).inject(0) do |sum, year|
  sum += 1.upto(12).count do |month|
    Time.new(year, month, 1).sunday?
  end
end)

