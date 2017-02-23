class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    name.split(' ').join('-').downcase
  end

  def self.find_by_slug(slug)
     unslug = slug.split('-').map {|word| word }.join(' ')
     found = self.where("lower(name) = \'#{unslug}\'").first
  end


end
