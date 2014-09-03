#!/usr/bin/env ruby

require_relative '../../lib/util'
require_relative '../../lib/prime'

ns_1 = [2, 3, 4, 5, 6, 7].permutation.map { |a| a.inject(0) { |s, d| 10*s+d } * 10 + 1 }
ns_3 = [1, 2, 4, 5, 6, 7].permutation.map { |a| a.inject(0) { |s, d| 10*s+d } * 10 + 3 }
ns_7 = [1, 2, 3, 4, 5, 6].permutation.map { |a| a.inject(0) { |s, d| 10*s+d } * 10 + 7 }
ns = (ns_1 + ns_3 + ns_7).sort.reverse
p ns.find { |n| is_prime?(n) }

p 'Result: '
