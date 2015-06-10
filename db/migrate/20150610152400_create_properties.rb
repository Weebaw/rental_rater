class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.string :building_type
      t.string :building_name
      t.string :apt_number
      t.string :city
      t.string :landlord
      t.integer :rating_total
      t.integer :city_id

    end
  end
end
