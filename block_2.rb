#2, #3
# 5.times do |num| 
# 	puts "#{num} sit up"
# 	puts "#{num} pushup"
# 	puts "#{num} chinup"
# end

# #4
# 1.upto(5) do |num|
# 	puts "#{num} sit up"
# 	puts "#{num} pushup"
# 	puts "#{num} chinup"
# end

# Create Frequent Flyers

class Flyer
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

flyers = []

1.upto(5) do |i| 
	flyers << Flyer.new("Flyer #{i}", "flyer#{i}@example.com", i * 1000)
end

puts flyers

#Bonus Round

# use upto method
1.upto(9) do |i|
	puts "#{i} situp"
	puts "#{i} pushup"
	puts "#{i} chinup"
end		

puts "******************"

#use step method

1.step(9, 2) do |i|
	puts "#{i} situp"
	puts "#{i} pushup"
	puts "#{i} chinup"
end		


