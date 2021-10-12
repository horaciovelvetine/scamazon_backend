class CreateItemsSearchesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :searches do |t|
      t.index :item_id
      t.index :search_id
  end
end
