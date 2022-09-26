class RenameIsEnableColumnInCategories < ActiveRecord::Migration[7.0]
  # up method will be executed when u migrate
  def up
    rename_column :categories, :is_enable, :is_active
  end
  
  # down method will be executed when u rollback
  def down
    rename_column :categories, :is_active, :is_enable
  end
end
