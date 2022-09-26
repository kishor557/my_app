class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.float :price
      t.text :address
      t.string :pin_code
      t.string :phone
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
