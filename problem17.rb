class Textifier
  
  def initialize
    @units_and_teens = {0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
    @tens = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}
  end

  def digits(number)
    number.to_s.split("").map { |s| s.to_i }
  end

  def to_text(number)
    parts = digits(number)
    return "TODO" unless parts.count < 4
    parts = pad_with_zeros(parts)
    number_text = ""
    if parts[0] > 0
      number_text += @units_and_teens[parts[0]] + " hundred "
      number_text += "and " if (parts[1] != 0 || parts[2] != 0)
    end
    if parts[1] > 1
      number_text += @tens[parts[1]]
      number_text += "-" unless parts[2] == 0
    end
    if parts[1] == 1
      number_text += @units_and_teens[parts[1..2].join.to_i]
    else
      number_text += @units_and_teens[parts[2]]
    end
  end

  def pad_with_zeros(parts)
    while parts.count < 3
      parts.unshift(0)
    end
    parts
  end
end

def count_letters(string)
  count = string.split("").count{|s| s != "-" && s != " "}
  puts "#{string}(#{count})"
  count
end

def number_letter_counts(limit)
  letter_count = 0
  numbers = (1..limit)
  tf = Textifier.new
  numbers.each do |x|
    letter_count += count_letters(tf.to_text(x))
  end
  letter_count
end

number_letter_counts(5)
