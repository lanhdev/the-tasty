class AddHitCountToFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :hit_count, :integer
  end
end
