class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :sku, limit: 10
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.decimal :rating, precision: 3, scale: 2
      t.string :brand
      t.string :weight
      t.string :dimensions
      t.string :manufacturer
      t.string :origin
      t.string :color
      t.string :material
      t.integer :quantity
      t.references :inventory, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.references :order, null: true, foreign_key: true
      t.references :shopping_cart, null: true, foreign_key: true

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :sku, unique: true
  end
end
