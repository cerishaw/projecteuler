def divisors(x)
  divs = []
  (1..x/2).each do |y|
    divs << y if x % y == 0
  end
  divs
end

def amicable?(x)
  sum = divisors(x).inject(:+)
  pair_sum = divisors(sum).inject(:+)
  pair_sum == x && x != sum
end

def sum_amicables(limit)
  amicable_list = []
  (2..limit).each do |num|
    next if amicable_list.include?[num]
    if amicable?(num)
      pair = divisors(num).inject(:+)
      amicable_list << num
      amicable_list << pair
    end
  end
  amicable_list.uniq.inject(:+)
end

sum_amicables 10000