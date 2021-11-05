class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :sub_total, precision: 10, scale: 2
      t.decimal :grand_total, precision: 10, scale: 2
      t.decimal :shipping, precision: 6, scale: 2
      t.datetime :shipped_on
      t.string :shipping_info
      t.string :tracking_info
      t.boolean :slime
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
