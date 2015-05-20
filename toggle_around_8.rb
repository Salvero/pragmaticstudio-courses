class Application
  attr_accessor :environment

  def initialize
    @environment = :development
  end

  def connect_to_database
    puts "Connecting to #{@environment} database..."
  end

  def handle_request
    puts "Handling #{@environment} request..."
  end

  def write_to_log
    puts "Writing to #{@environment} log file..."
  end
end

#3
app = Application.new
app.environment = :production
app.connect_to_database
app.handle_request
app.write_to_log
app.environment = :development

#4
def in_production
  old_environment = @environment
  @environment = :production
  yield
  @environment = old_environment
  puts "Reset environment to #{@environment}"
end

#Handle Exceptions

#1
app.in_production do
  app.connect_to_database
  app.handle_request
  raise "Boom!"
  app.write_to_log
end

#2 - Ensure to switch back to the previous environment
def in_production
    old_environment = @environment
    @environment = :production
    yield
  ensure
    @environment = old_environment
    puts "Reset environment to #{@environment}"
end

#3 - Rescue any exceptions raised by the block 
def in_production
    old_environment = @environment
    @environment = :production
    yield
  rescue Exception => e
    puts e.message
  ensure
    @environment = old_environment
    puts "Reset environment to #{@environment}"
end


## Make It More Generic

def in_environment(new_environment)
  old_environment = @environment
  @environment = new_environment
  yield
rescue Exception => e
  puts e.message
ensure
  @environment = old_environment
  puts "Reset environment to #{@environment}"
end

app.in_environment(:production) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end

app.in_environment(:test) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end


