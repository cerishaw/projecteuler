def read_file(filename)
  lines = []
  File.open(filename, "r") do |f|
    f.each_line do |line|
      lines << line
    end
  end
  lines[0]
end

def to_name_array(text)
  text.split(",").map{|name| name.chomp('"').reverse.chomp('"').reverse}
end

def score_name(name)
  name.split("").map { |c| c.ord - 'A'.ord + 1 }.inject(:+)
end

def names_score
  scores = []
  file_contents = read_file("p022_names.txt")
  names = to_name_array(file_contents).sort
  index = 0
  while index < names.count
    scores << score_name(names[index]) * (index + 1)
    index += 1
  end
  scores.inject(:+)
end