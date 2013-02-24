#!/usr/bin/env ruby

900.upto(999).each do |a|
  900.upto(999).each do |b|
    0.upto(9).each do |e|
      0.upto(9).each do |f|
        n = 900009 + 10010 * e + 1100 * f
        if n == a * b
          p "#{n} = #{a} * #{b}"
        end
      end
    end
  end
end
