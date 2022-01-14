class AddReferenceToPackage < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :package, null: false, foreign_key: true
  end
end
