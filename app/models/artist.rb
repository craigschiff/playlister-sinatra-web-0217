class Artist < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
  # has_many :genres, through: :song_genres
  def slug
    name.split(' ').join('-').downcase
  end

  def self.find_by_slug(slug)
     unslug = slug.split('-').map {|word| word }.join(' ')
     self.where("lower(name) = \'#{unslug}\'").first
  end


end
