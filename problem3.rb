def prime?(x)
  divisor = Math.sqrt(x).round
  while divisor > 1 do
    return false if x % divisor == 0
    divisor = divisor - 1
  end
  true
end

def next_prime_down(x)
  next_no = x - 1
  while !prime?(next_no) do
    next_no -= 1
  end
  next_no
end

def highest_prime_factor(x)
  max = Math.sqrt(x).round
  prime_no = next_prime_down(max + 1)
  while prime_no > 1 do
    return prime_no if x % prime_no == 0
    prime_no = next_prime_down(prime_no)
  end
  return 0
end

highest_prime_factor(13195)
highest_prime_factor(600851475143)