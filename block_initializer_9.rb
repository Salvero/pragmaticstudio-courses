class Canvas
  attr_accessor :width, :height, :color

  def initialize
    @width = 100
    @height = 100
    @color = :black

    #4
    yield self if block_given?

  end

  def draw_rect(x, y, width, height)
    # draws a rectangle
  end

  def to_s
    "#{@width}x#{@height} #{@color} canvas"
  end
end

#2, #3
canvas = Canvas.new do |c|
  c.width = 250
  c.height = 500
  c.color = :blue
end 

puts canvas

# Quiz
class Canine
  attr_accessor :name, :breed, :age

  def initialize
    @name = "Snoopy"
    @breed = "unknown"

    #2
    yield self if block_given?

  end
end

dog = Canine.new do |c|
  c.name = "Buddy"
  c.breed = "Golden Retriever"
  c.age = 4
end

p dog

# Output without yield self: #<Canine:0x000000022d5d50 @name="Snoopy", @breed="unknown">
# Output with yield self: #<Canine:0x0000000150dc18 @name="Buddy", @breed="Golden Retriever", @age=4>

#2 - Create Casine object for yield self
# yield self if block_given?
