class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, unique: true
      t.string :sku, unique: true
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.decimal :rating, precision: 3, scale: 2, default: 0.0
      t.string :manufacturer
      t.string :country_origin
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :order, null: true, foreign_key: true
      t.belongs_to :shopping_cart, null: true, foreign_key: true
      t.belongs_to :inventory, null: false, foreign_key: true

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :sku
  end

end
