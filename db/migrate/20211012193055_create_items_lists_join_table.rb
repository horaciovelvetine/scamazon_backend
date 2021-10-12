class CreateItemsListsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :lists do |t|
      t.index :item_id
      t.index :list_id
  end
end
