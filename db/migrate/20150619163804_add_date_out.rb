class AddDateOut < ActiveRecord::Migration
  def change
    add_column :comments, :date_out, :date
  end
end
