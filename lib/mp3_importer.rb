class MP3Importer

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		Dir.entries(@path).select {|f| !File.directory? f}
	end

	def import
		files = self.files
		files.each do |file|
			self.class.create_by_filename(file)
		end
	end

	def self.create_by_filename(file)
		split = file.split " - "
		artist = Artist.find_or_create_by_name(split[0])
		song = Song.new(split[1])
		song.artist = artist
		artist.songs << song
		song
	end
end

