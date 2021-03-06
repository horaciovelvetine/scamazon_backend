class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name, null: false
      t.string :model, unique: true
      t.bigint :sku, unique: true
      t.decimal :price, precision: 10, scale: 2
      t.string :color
      t.string :material
      t.integer :quantity, null: false
      t.string :weight
      t.string :dimensions
      t.string :manufacturer
      t.string :country_origin
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :order, null: true, foreign_key: true
      t.belongs_to :shopping_cart, null: true, foreign_key: true
      t.belongs_to :return, null: true, foreign_key: true

      t.timestamps
    end
    add_index :styles, :model
    add_index :styles, :sku
  end
end
