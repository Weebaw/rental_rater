class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :rating
      t.integer :property_id
      t.integer :user_id
      t.date :dates
    end
  end
end
