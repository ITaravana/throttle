class Vehicle < ActiveRecord::Base
  
  has_many :vehicle_images
  has_many :taggings
  has_many :reservation
  has_many :tags, through: :taggings
  belongs_to :user
  mount_uploader :image, ImageUploader

def full_address
[address, city, country].compact.join(',')
end

  geocoded_by :full_address             # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  #Getter and Setter for all_tags vertial at tribute
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
    Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
