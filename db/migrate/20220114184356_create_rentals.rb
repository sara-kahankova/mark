class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :title
      t.string :address
      t.text :description
      t.integer :price
      t.string :size
      t.string :city

      t.timestamps
    end
  end
end
