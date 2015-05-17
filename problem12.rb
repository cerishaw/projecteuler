def triangle_no(x)
  (1..x).to_a.inject(:+)
end

def divisor_count(x)
  count = 2
  possibles = (2..(x/2 + 1)).to_a
  ##possibles.count{|p| x % p == 0} + 2
  #test_num = possibles.first
  #count += 2 if x % test_num == 0
  #possibles = 3..(x/3 +1)

  while possibles.length > 2 do
    num = possibles[0]
    count += 2 if x % num == 0
    next_num = possibles[1]
    possibles = (next_num..(x/next_num + 1)).to_a
  end
  count
end

def highly_divisible_triangle_number(check)
  x = 2
  result = 2
  while result < check do
    x += 1
    tn = triangle_no(x)
    result = divisor_count(tn)
    puts "result: #{result} x: #{x} triangle no:#{tn}"
  end
  tn
end

highly_divisible_triangle_number(5)
highly_divisible_triangle_number(500)