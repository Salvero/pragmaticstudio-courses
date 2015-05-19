#Song
class Album
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

song1 = Album.new("Tick Tick Tonk", "Harry", 8)
song2 = Album.new("Rusco Man", "Tony", 9)
song3 = Album.new("Heart", "Flex", 8)

puts song1.play
puts song2.play
puts song3.play

#2, #3
class Playlist
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each 
  	@songs.each { |song| yield song }
  end

  def play_songs
  	each { |song| song.play }
  end
end

#4
playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

#5
playlist.each { |song| song.play }

#6
playlist.play_songs


#Include Mix In Enumerable

class Playlist
 include Enumerable

 def each
	  @songs.each do |song|
	    puts "Yielding #{song.name}..."
	    yield song
	  end
	end

end

okie_songs = playlist.select { |song| song.name =~ /Okie/ }
p okie_songs

non_okie_songs = playlist.reject { |song| song.name =~ /Okie/ }
p non_okie_songs

p playlist.any? { |song| song.artist == "Hank" }
p playlist.detect { |song| song.artist == "Hank" }

song_labels = playlist.map { |song| "#{song.name} - #{song.artist}" }
p song_labels

total_duration = playlist.reduce(0) { |sum, song| sum + song.duration }
p total_duration

#3

def each_tagline
  @songs.each { |song| yield "#{song.name} - #{song.artist}" }
end

playlist.each_tagline { |tagline| puts tagline }

#4
def each_by_artist(artist)
  select { |song| song.artist == artist }.each { |song| yield song }
end

playlist.each_by_artist("Hank") { |song| song.play }


#5
class Song
  def each_filename
    basename = "#{name}-#{artist}".gsub(" ", "-").downcase
    extensions = [".mp3", ".wav", ".aac"]
    extensions.each { |ext| yield basename + ext }
  end
end

song.each_filename { |filename| puts filename }
