#!/usr/bin/env ruby

require_relative '../../lib/util'

$primes = [3, 5, 7, 11]

def is_prime?(n)
  $primes.all? { |p| n % p != 0 }
end

def is_square_number?(n)
  (n ** 0.5).round ** 2 == n
end

n = $primes[-1]
loop do
  n += 2
  if is_prime?(n)
    $primes << n
  else
    if $primes.all? { |p| !is_square_number?((n - p) / 2) }
      break
    end
  end
end

p 'Result: ', n
