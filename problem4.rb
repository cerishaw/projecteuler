def palindrome?(x)
  x.to_s == x.to_s.reverse
end

def highest_palindrome(starter)
  x = starter
  y = starter
  min = starter / 10 + 1
  while x > min do
    result = x * y
    return result if palindrome?(x * y)
    x -= 1
  end
  -1
end

def highest_3_digit_palindrome
  x = 999
  result = highest_palindrome(x)
  answer = result
  while x > 100 do
    x -= 1
    result = highest_palindrome(x)
    answer = result if answer < result
  end
  answer
end

highest_3_digit_palindrome