require "prime.rb"

def list_of_primes(count)
  primes = [2]
  x = 3
  while primes.length < count do
    primes << x if Prime.prime?(x)
    x += 2
  end
  primes
end

list_of_primes(6).last
list_of_primes(10001).last