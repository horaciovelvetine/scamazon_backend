class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal :sub_tot, precision: 10, scale: 2
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
