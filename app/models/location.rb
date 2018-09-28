class Location < ActiveRecord::Base
  has_many :countrys, through: :location_country
end