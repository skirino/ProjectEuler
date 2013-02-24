require 'set'

# I know this is quite naive implementation.
$primes = Set.new
$primes.add(2)

def is_prime?(n)
  raise if n <= 1
  return true  if n == 2
  return false if n % 2 == 0
  return true  if $primes.include?(n)

  result = 3.upto((n ** 0.5).floor).select(&:odd?).all? { |i| n % i != 0 }
  $primes.add(n) if result
  result
end
