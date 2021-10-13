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
      t.integer :weight

      t.belongs_to :inventory
      t.belongs_to :order, null: true
      t.belongs_to :shopping_cart, null: true

      t.timestamps
    end
  end
end
