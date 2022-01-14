class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.references :reference, null: false, foreign_key: true

      t.timestamps
    end
  end
end
