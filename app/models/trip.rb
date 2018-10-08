class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :locations

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:year_visited].empty?
  end
end
