class Location < ActiveRecord::Base
  belongs_to :trip

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:description].empty?
  end
end
