class CreateItemsShoppingCartsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :shopping_carts, column_options: { null: false, foreign_key: true } do |t|
      t.index [:item_id, :shopping_cart_id]
      t.index [:shopping_cart_id, :item_id]
    end
    
  end
end
