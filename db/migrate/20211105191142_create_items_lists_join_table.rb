class CreateItemsListsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :lists, column_options:{ null: false, foreign_key: true} do |t|
      t.index [:item_id, :list_id]
      t.index [:list_id, :item_id]
    end
  end
end