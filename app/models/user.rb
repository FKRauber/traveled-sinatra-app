class User < ActiveRecord::Base
  has_many :locations, through: :location_country
  has_many :countrys, through: :location_country
  has_many :location_country
end
