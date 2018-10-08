class CreateTrips < ActiveRecord::Migration
  def change
  	create_table :trips do |t|
      t.string :name
      t.integer :year_visited
      t.integer :user_id
    end
  end
end
