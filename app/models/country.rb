class Country < ActiveRecord::Base
  has_many :locations, through: :location_country
end