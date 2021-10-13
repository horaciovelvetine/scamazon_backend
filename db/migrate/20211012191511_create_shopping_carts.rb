class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.integer :item_count, default: 0
      t.money :total, null: false
      t.belongs_to :user, null: true

      t.timestamps
    end
  end
end
