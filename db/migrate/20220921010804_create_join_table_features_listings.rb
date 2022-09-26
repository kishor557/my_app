class CreateJoinTableFeaturesListings < ActiveRecord::Migration[7.0]
  # JOIN TABLE Migration
  def change
   create_join_table :features, :listings do |t|
      t.index :feature_id
      t.index :listing_id
    end
  end
end
