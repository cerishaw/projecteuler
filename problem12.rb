require "prime.rb"

def next_prime_factor(x)
  return x if Prime.prime?(x)
  possibles = (2..x/2)
  possibles.each do |p|
    return p if Prime.prime?(p) && x % p == 0
  end
  1
end

def prime_factors(x)
  factor_list = []
  remainder = x
  while remainder > 1
    highest_factor = highest_prime_factor(remainder)
    factor_list << highest_factor
    remainder = remainder/highest_factor
  end
  factor_list
end

def count_instances(array)
  array.each_with_object(Hash.new(0)) {|n, counts| counts[n] += 1 }.values
end

def divisor_count(x)
  factors = prime_factors(x)
  count_of_factors = count_instances(factors)
  count_of_factors.inject(1) {|product, n| product * (n + 1)}
end

def triangle_no(x)
  (1..x).to_a.inject(:+)
end


def highly_divisible_triangle_number(check)
  x = check
  result = 2
  while result < check do
    x += 1
    tn = triangle_no(x)
    result = divisor_count(tn)
  end
  tn
end

highly_divisible_triangle_number(5)
highly_divisible_triangle_number(500)