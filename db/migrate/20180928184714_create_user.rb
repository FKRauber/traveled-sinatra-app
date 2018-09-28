class CreateUser < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :country_id
    end
  end
end
