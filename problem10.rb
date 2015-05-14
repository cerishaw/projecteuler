require "prime.rb"

def sum_of_primes_below(limit)
  total = 2
  x = 3
  while x < limit do
    total += x if Prime.prime?(x)
    x += 2
  end
  total
end

def sum_of_primes(limit)
  total = 2
  potentials = 2..limit.to_a.delete_if{|x| x % 2 == 0}
  trial_prime = potentials.first
  while potentials.length > 0 do
    total += trial_prime
    potentials.delete_if{|x| x % trial_prime == 0}
    trial_prime = potentials.first
  end
  total
end

sum_of_primes_below(10)