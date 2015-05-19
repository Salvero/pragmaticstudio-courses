#1
def h1
	print "<h1>"
	print yield
	puts "</h1>"
end

h1 { "Breaking News!" }

#2
def h2
	print "<h2>"
	print yield
	puts "</h2>"
end

h2 { "Massive Ruby Discovered" }

#3
def tag(name)
	print "<#{name}>"
	print yield
	puts "</#{name}>"
end

tag(:h1) { "Breaking News!" }
tag(:h2) { "Massive Ruby Discovered" }

#4
tag(:ul) do
	tag(:ul) { "It sparkles!"}
	tag(:ul) { "It shines!"}
	tag(:ul) { "It mesmerizes!"}		
end

#Generate Debugging and Expectation Code

#1 - Bugs Errors

# puts "Got Here!"

# magic_number = (23 - Time.now.hour) * Math::PI

# puts "Result was #{result}"

def fixing
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

fixing do

  magic_number = (23 - Time.now.hour) * Math::PI

end


#2

def with_expectation(expected_value)
  puts "Running test..." 
  result = yield
  if result == expected_value
    puts "Passed."
  else
    puts "Failed!"
    puts "Expected #{expected_value}, but got #{result}."
  end
end

with_expectation(4) { 2 + 2 }

#Passed

with_expectation(5) { 2 + 2 }

Failed

###Examples In The Wild

#User Benchmark method - Ruby standard library

#1
require 'benchmark'

elapsed_time = Benchmark.realtime do
  # run some code
  sleep(1)
end

puts "It took #{elapsed_time}"

2
def content_tag(name)
	print "<#{name}>"
	print yield
	puts "</#{name}>"
end

content_tag(:h1) { "Ruby on Rails!" }
# => <h1>Ruby on Rails!</h1>

content_tag(:div) { content_tag(:p) { "Web development that doesn't hurt" } }
# => <div><p>Web development that doesn't hurt</p></div>


#Bonus Round
def time_it(name)
	time = Benchmark.realtime do
		yield
	end
	puts "#{name} took #{time}"
end

time_it("Sleepy code") do
  # run some code
  sleep(1)
end