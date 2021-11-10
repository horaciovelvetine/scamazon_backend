class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal :sub_total, precision: 10, scale: 2, default: 0.0
      t.integer :num_items, default: 0
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
