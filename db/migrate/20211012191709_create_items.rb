class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.string :model
      t.string :manufacturer, null: false
      t.string :country_of_origin, null: false
      t.string :picture
      t.string :material
      t.money :price, null: false
      t.bigint :sku, unique: true
      t.decimal :rating, default: 0
      t.smallint :weight

      t.reference :inventory_item, null: false, foreign_key: true
      t.reference :order, null: true, foreign_key: true
      t.reference :shopping_cart, null: true, foreign_key: true

      t.timestamps
    end
  end
end
