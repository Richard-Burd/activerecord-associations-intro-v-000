class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  validates :name, :presence => true #=> Validations like this guard against creating bad data when persisting data
                                    # a = Artist.new
                                    # a.errors
                                    # a.save #=> false (because you didn't give it a name yet)

  after_create :email_people        # this just does s.thing after you create an instance of the class

  def email_people
    puts "I've sent an email to confirm this was created: #{self}"
  end

  def get_first_song
    self.songs.first
  end

  def get_all_songs
    self.songs
  end

  # You can hook into the initialize method...
  after_initialize do |artist_object_id|
    puts "You just made an artist #{artist_object_id}"
  end

  # ...but this is more mantainable if you wanted this sort of thing:
  def self.new_with_message
    object = self.new
    puts "You just made an artist #{object}"
  end
end
