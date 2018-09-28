class CreateLocations < ActiveRecord::Migration
  def change
  	create_table :locations do |t|
      t.string :name
      t.integer :year_completed
    end
  end
end
