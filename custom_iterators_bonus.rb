#1
module MyEnumerable
  def my_map
    new_array = []
    each do |value|
      new_array << yield(value)
    end
    new_array
  end

  def my_select
    new_array = []
    each do |value|
      new_array << value if yield(value)
    end
    new_array
  end
end

#2
class Playlist
   # include Enumerable
   include MyEnumerable

   # existing code
end

#3 Open another file - my_enumerable.rb, use require_relative 
require_relative 'my_enumerable'

okie_songs = playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels


#6
def my_reject
  new_array = []
  each do |value|
    new_array << value unless yield(value)
  end
  new_array
end

non_okie_songs = playlist.my_reject { |song| song.name =~ /Okie/ }
p non_okie_songs

#7
def my_detect
  each do |value|
    return value if yield(value)
  end
  nil
end

p playlist.my_detect { |song| song.artist == "Hank" }

#8
def my_any?
  each do |value|
    return true if yield(value)
  end
  false
end

p playlist.my_any? { |song| song.artist == "Hank" }

