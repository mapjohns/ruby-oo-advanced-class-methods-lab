require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    # song.name = name
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil
      self.create_by_name(song)
    else
      self.find_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(file)
    testing = file.split(" - ")
    artist = testing[0]
    s_name = testing[1].chomp(".mp3")
    song = Song.new
    song.name = s_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    testing = file.split(" - ")
    artist = testing[0]
    s_name = testing[1].chomp(".mp3")
    song = Song.new
    song.name = s_name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
end
