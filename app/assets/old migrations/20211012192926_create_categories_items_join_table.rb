class CreateCategoriesItemsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :items do |t|
      t.index :category_id
      t.index :item_id
    end
  end
end
