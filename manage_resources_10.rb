#Practice with Examples

#2
class SportyClient
  def post(message)
    raise "Not signed in!" unless @user
    # post message to remote service
    puts "#{@user} posted message: #{message}"
  end

  def timeline
    raise "Not signed in!" unless @user
    # get timeline from remote service
    puts "#{@user} fetched timeline..."
  end

  def sign_in(user)
    # sign in to remote service
    @user = user
    puts "#{user} signed in."
  end

  def sign_out(user)
    # sign out of remote service
    puts "#{user} signed out!"
  end
end

client = SportyClient.new

client.sign_in("Jonny")
client.post("Ready for the new season...")
client.post("Football Playoff are going all the way!")
client.timeline
client.sign_out("Jonny")

#3
def as_signed_in_user(user)
  sign_in(user)
  begin
    yield
  ensure
    sign_out(user)
  end
end

client.as_signed_in_user("Jonny") do
  client.post("Ready for the new season...")
  client.post("Football Playoff are going all the way!")
  client.timeline
end

#4
client.as_signed_in_user("Snider") do
  client.post("Not if we can help it...")
  raise "Boooo!"
end

###Manage a Database Connection

class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end
end

#2 run SQL queries

driver = DatabaseDriver.new("my_database", "admin", "secret") do |driver|
  driver.execute("SELECT * FROM ORDERS")
  driver.execute("SELECT * FROM USERS")
end

def self.open(database, user, password)
  driver = self.new(database, user, password)
  driver.connect

  return driver unless block_given?

  begin
    yield(driver)
  ensure
    driver.disconnect
  end
end

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.execute("DELETE * FROM ORDERS")
  raise "Boom!"
  driver.execute("DELETE * FROM USERS")
end

