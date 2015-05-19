#1
scores = [83, 71, 92, 64, 98, 87, 75, 69]

scored_doubled = scores.map { |x| scores * 2 }

print scored_doubled

#2
total = scores.reduce(0) { |sum, score| sum + score }
puts "Total score: #{total}"

#use shortcut

total = scores.reduce(0, :+)
puts "Total score: #{total}"


#3
evens, odds = scores.partition { |v| v.even? }
puts "Evens are " 
puts evens

puts "***********************"

puts "Evens are " 
puts odds


#Analyze Frequent Flyers More

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

#1
platinum_flyers, other_flyers = flyers.partition { |flyer| flyer.status == :platinum}
puts "Platinum Flyers:"
puts platinum_flyers

puts "Other Flyers:"
puts other_flyers

puts "********************************"

#2
name_medal = flyers.map { |flyer| "#{flyer.name} (#{flyer.status.upcase})" }
puts name_medal

puts "********************************"

#3
data_kms = flyers.map { |flyer| puts "#{flyer.miles_flown * 1.6} kilometers"}

puts "********************************"

#4
data_totalmiles = flyers.reduce(0) { |sum, flyer| sum + (flyer.miles_flown) }
puts "Total Flyers Flown: #{data_totalmiles}"

#5
data_totalkm = flyers.reduce(0) { |sum, flyer| sum + (flyer.miles_flown * 2) }
puts "Total Flyers Flown: #{data_totalkm}"


#Bonus Round

bronze_flown = flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6 }.reduce(:+)
puts bronze_flown

top_flyer = flyers.max_by { |f| f.miles_flown }
puts "Top Flyer: #{top_flyer}"








