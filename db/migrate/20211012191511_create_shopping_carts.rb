class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.smallint :item_count, default: 0
      t.money :total, null: false
      t.reference :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
