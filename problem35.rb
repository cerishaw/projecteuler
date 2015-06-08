def list_of_primes(min, max)
  primes = [min]
  x = min + 1
  while x < max do
    primes << x if Prime.prime?(x)
    x += 2
  end
  primes
end

def circular?(p, all_primes)
  result = true
  perms = permutations_of(p)
  perms.each do |perm|
    return false unless all_primes.include?(perm)
  end
  true
end

def permutations_of(p)
  permutations = [p]
  digits = p.to_s.split("").map{|d| d.to_i}.rotate
  num = digits.join.to_i
  while num != p do
    permutations << num
    digits = digits.rotate
    num = digits.join.to_i
  end
  permutations.uniq
end

def put_it_all_together(limit)
  circular_primes = []
  all_primes = list_of_primes(2,limit)
  all_primes.each do |prime|
    circular_primes << prime if circular?(prime, all_primes)
  end
  circular_primes
end