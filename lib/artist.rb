class Artist
	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def add_song(song)
		song.artist = self
		@songs << song
	end

	def self.find_or_create_by_name(name)
		# require 'byebug'
		# byebug
		artist = @@all.find {|artist| artist.name == name}
		if !artist
			artist = Artist.new(name)
			artist.save
		end
		artist
	end

	def print_songs
		@songs.each {|song| puts "#{song.name}"}
	end

end