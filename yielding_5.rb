# #2
# def three_times
# 	yield(1)
# 	yield(2)
# 	yield(3)
# end

# three_times { puts "Ho!" }

# #3
# three_times do |number|
#   puts "#{number} situp"
#   puts "#{number} pushup"
#   puts "#{number} chinup"
# end

# #4
# def four_times
# 	1.upto(4) do |count|
# 		yield(count)
# 	end
# end

# four_times { puts "Four time!" }

# Deal Parameters

# def deal
#   faces = ["Jack", "Queen", "King", "Ace"]
#   suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
#   random_face = faces.sample
#   random_suit = suits.sample
#   # call the block here
#   yield random_face, random_suit
# end

# 2
# deal { |face, suit| puts "Dealt a #{face} of #{suit}"}

# 3
# deal do |face, suit|
# 	puts "Dealt a #{face} of #{suit}"
# 	total_deal = face.length + suit.length
# 	#4
# 	puts "You scored a #{total_deal}"
# end

# #5
# def poker
#   faces = ["Jack", "Queen", "King", "Ace"]
#   suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
#   if block_given?
#     random_face = faces.sample
#     random_suit = suits.sample
#     score = yield random_face, random_suit
#     puts "You scored a #{score}!"
#   else
#     puts "No deal!"
#   end
# end

# puts poker

#Bonus Round
#1
def n_times(number)
	1.upto(number) do |count|
		yield(count)
	end
end

n_times(5) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

#2
def deal(number_of_cards)
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  if block_given?
    number_of_cards.times do
      random_face = faces.sample
      random_suit = suits.sample
      score = yield random_face, random_suit
      puts "You scored a #{score}!"
    end
  else
    puts "No deal!"
  end
end

#3
def progress
  0.step(by: 10, to: 100) do |number|
    yield number
  end
end

progress { |percent| puts percent }

#4
def person
  yield "Donald", 55
end

person { |name, age| puts "Hello, #{name}. You don't look #{age}, maybe 38!" }
