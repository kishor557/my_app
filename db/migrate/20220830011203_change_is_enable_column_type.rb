class ChangeIsEnableColumnType < ActiveRecord::Migration[7.0]
  # up method will be executed when u migrate
  def up
    change_column :categories, :is_enable, :boolean
  end
  
  # down method will be executed when u rollback
  def down
    change_column :categories, :is_enable, :string
  end
end
