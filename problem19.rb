require "date"

def leap_year?(year)
  divisible_by_four = year % 4 == 0
  divisible_by_100 = year % 100 == 0
  divisible_by_400 = year % 400 == 0
  divisible_by_four && (!divisible_by_100 || (divisible_by_100 && divisible_by_400))
end

def years_where_sunday_is_first(day_of_week_in_1900, month)
  sunday_counter = 0
  day_counter = day_of_week_in_1900
  (1901..2000).each do |year|
    year_to_test = month < 3 ? year : year -1
    if leap_year?(year_to_test)
      day_counter += 2
    else day_counter + 1
    end
    sunday_counter += 1 if day_counter % 7 == 6
  end
  sunday_counter
end

def day_of_week_in_1900(month, date)
  date = Date.new(1900,month,date)
  date.cwday - 1
end

#this is off by 3
def sunday_count
  sunday_count = 0
  (1..12).each do |month|
    day_of_first = day_of_week_in_1900(month, 1)
    sunday_count += years_where_sunday_is_first(day_of_first, month)
  end
  sunday_count
end

#this works
def cheat_count
  sunday_count = 0
  (1901..2000).each do |year|
    (1..12).each do |month|
      date = Date.new(year,month,1)
      sunday_count += 1 if date.sunday?
    end
  end
  sunday_count
end