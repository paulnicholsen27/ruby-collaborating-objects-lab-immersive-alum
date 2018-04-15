class Song
	attr_accessor :name, :artist

	def initialize(name=nil)
		@name = name
	end

	def self.all
		@@all
	end

	def self.new_by_filename(filename)
		MP3Importer.create_by_filename(filename)

	end
end