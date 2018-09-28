class LocationCountry < ActiveRecord::Base
  belongs_to :location
  belongs_to :country
end