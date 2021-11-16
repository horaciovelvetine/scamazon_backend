class CreateItemsOrdersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :orders, column_options: { null: false, foreign_key: true } do |t|
      t.index [:item_id, :order_id]
      t.index [:order_id, :item_id]
    end
    
  end
end
