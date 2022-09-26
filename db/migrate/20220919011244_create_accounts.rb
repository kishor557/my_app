class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :phone
      t.belongs_to :supplier, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
