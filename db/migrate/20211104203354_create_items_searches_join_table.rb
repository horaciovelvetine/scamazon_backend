class CreateItemsSearchesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :searches, column_options: { null: false, foreign_key: true } do |t|
      t.index [:item_id, :search_id]
      t.index [:search_id, :item_id]
    end
  end
end




