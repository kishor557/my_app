class ChangeColumnDefaultForIsEnableInCategories < ActiveRecord::Migration[7.0]
  # up method will be executed when u migrate
  def up
    change_column_default :categories, :is_enable, default: true
  end
  
  # down method will be executed when u rollback
  def down
    change_column_default :categories, :is_enable, default: false
  end
end
