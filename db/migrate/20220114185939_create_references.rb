class CreateReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :references do |t|
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end
