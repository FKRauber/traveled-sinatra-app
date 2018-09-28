class CreateLocationCountry < ActiveRecord::Migration
  def change
	create_table :location_country do |t|
      t.integer :location_id
      t.integer :country_id
    end
  end
end