#!/usr/bin/env ruby

require_relative '../util'

class Decimal
  def initialize(n, d)
    raise if n >= d

    states = []
    remaining = 10*n
    loop do
      state = remaining / d, remaining % d

      if (recurring_start = states.index(state))
        digits = states.map(&:first)
        @recurring_part    = digits.pop(digits.size - recurring_start)
        @nonrecurring_part = digits
        break
      end

      states << state
      remaining = state[1] * 10
      if remaining == 0
        @recurring_part    = []
        @nonrecurring_part = states.map(&:first)
        break
      end
    end
  end

  def to_s
    if @recurring_part.empty?
      "0.#{@nonrecurring_part.map(&:to_s).inject(:+)}"
    else
      "0.#{@nonrecurring_part.map(&:to_s).inject(:+)}(#{@recurring_part.map(&:to_s).inject(:+)})"
    end
  end
end

p 2.upto(1000).max_by { |d| Decimal.new(1, d).instance_variable_get(:@recurring_part).size }
