class AddBedAndBathToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :bed, :integer
    add_column :rentals, :bath, :integer
  end
end
