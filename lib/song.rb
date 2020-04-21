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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end

  end


  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end

  def self.new_from_filename (filename)
    data = filename.split(/[-.]/)
    name = data[1].strip
    artist_name = data[0].strip

    song = self.new
    song.name = name
    song.artist_name = artist_name

    song

  end

  def self.create_from_filename (filename)
    data = filename.split(/[-.]/)
    name = data[1].strip
    artist_name = data[0].strip

    song = self.new
    song.name = name
    song.artist_name = artist_name

    @@all << song

    song

  end



  def self.destroy_all
    self.all.clear
  end



end
