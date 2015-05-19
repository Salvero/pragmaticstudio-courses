#1, #2, #3
# cards = ["Jack", "Queen", "King", "Ace", "Joker"]

# cards.each { |poker| puts poker.upcase }

#add numbers into cards

cards = { "Jack" => 4, "Queen" => 5, "King" => 4, "Ace" => 3, "Joker" => 5 }

# cards.each { |k,v| puts "#{k.upcase} - #{v}" }

#4
#use shuffle

# mania = [ "Mickey" => 5, "Donald" => 2, "Harry" => 9, "Jim" => 6 ]

# mania.shuffle.each { |m| puts m }

# #5

# mania.reverse_each { |m| puts m }
# cards.reverse_each { |m| puts m }

#6

# scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

# scores.each do |i,j|
# 	puts "#{i} scored a #{j}!"
# end

#Iterate Through Frequent Flyers

#1

# flyers = { "Flyer 1" => 1000, "Flyer 2" => 2000, "Flyer 3" => 3000, "Flyer 4" => 4000, "Flyer 5" => 5000 }

# flyers.each do |i,j|
# 	puts "#{i} - #{j} miles!"
# end

# #2
# class Flyer
#   attr_reader :name, :email, :miles_flown

#   def initialize(name, email, miles_flown)
#     @name = name
#     @email = email
#     @miles_flown = miles_flown
#   end

#   def to_s
#     "#{name} (#{email}): #{miles_flown}"
#   end
# end

# flyers = []

# 1.upto(5) do |i| 
# 	flyers << Flyer.new("Flyer #{i}", "flyer#{i}@example.com", i * 1000)
# end

# total = 0
# flyers.each do |i|
# 	total += i.miles_flown
# end

# puts "Total miles flown: #{total}"

# #3

# promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }

# promotions.each do |i, j|
# 	puts "Earn #{j}x miles by flying #{i}!"
# end		


# #Bonus Round

# file = File.open("poem.txt")
# file.each { |line| puts line }

# dir = Dir.new("/Users/salman")
# dir.each { |entry| puts entry }

# require 'mathn'

# Prime.each { |number| puts "Prime is #{number}" }

#Iterators within Iterators

travel_promotions = { "United" => 1500.0, "Delta" => 2000.0, "Lufthansa" => 2500.0 }

# travel_promotions.each do |i,j|
# 	puts "Flyer 1 could earn #{j} miles by flying #{i}"
# 	puts "Flyer 2 could earn #{j*2} miles by flying #{i}"
# 	puts "Flyer 3 could earn #{j*3} miles by flying #{i}"
# 	puts "Flyer 4 could earn #{j*4} miles by flying #{i}"
# 	puts "Flyer 5 could earn #{j*5} miles by flying #{i}"
# end

#or

class Travel
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

travels = []

1.upto(5) do |i| 
	travels << Travel.new("Flyer #{i}", "flyer#{i}@example.com", i * 1000)
end

travels.each do |flyer|
	travel_promotions.each do |air, multi|
		puts "#{flyer.name} could earn #{flyer.miles_flown * multi} miles by flying #{air}!"
	end
end

puts travels

