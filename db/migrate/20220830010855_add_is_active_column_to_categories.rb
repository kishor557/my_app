class AddIsActiveColumnToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :is_enable, :string
  end
end
