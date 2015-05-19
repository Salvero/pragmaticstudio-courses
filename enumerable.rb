#2
scores = [83, 71, 92, 64, 98, 87, 75, 69]

high_scores = scores.select { |x| x > 80 }

puts high_scores

puts "*************************"

#3
low_scores = scores.reject { |y| y > 80 }

puts low_scores

puts "*************************"

#4
puts scores.any? { |w| w < 70 }

puts "*************************"

#5
puts scores.detect { |w| w < 70 }


#Analyze Frequent Flyers

#2
class Medal
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Medal.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Medal.new("Moe", "moe@example.com", 1000)
flyers << Medal.new("Curly", "curly@example.com", 3000, :gold)
flyers << Medal.new("Shemp", "shemp@example.com", 2000)


more_frequent = flyers.select { |freq| freq.miles_flown > 3000 }
puts more_frequent

puts "**********************"

#3
less_frequent = flyers.select { |freq| freq.miles_flown < 3000 }
puts less_frequent

puts "**********************"

#4
puts flyers.any? { |freq| freq.status == :platinum }


puts "**********************"


#5
first_bronze = flyers.detect { |freq| freq.status == :bronze }
puts first_bronze


#Bonus Round

scores.select! { |score| score > 70 }
puts scores

puts "**********************"

# scores.reject! { |score| score.even? }
# puts scores

puts "**********************"

scores.reject! { |score| score.odd? }
puts scores


