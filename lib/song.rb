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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    return self.all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name[0]}
  end

  def self.new_from_filename(filename)
    path = filename.split(" - ")
    name = path[1].chomp(".mp3")
    artist = path[0]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    path = filename.split(" - ")
    name = path[1].chomp(".mp3")
    artist = path[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
