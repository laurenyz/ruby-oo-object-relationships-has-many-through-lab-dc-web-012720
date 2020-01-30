class Genre
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song_object|
            song_object.genre == self
        end
    end

    def artists
        self.songs.collect do |song_object|
            song_object.artist
        end
    end
end