class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.money :total, null: false
      t.string :ship_to_address, null: false
      t.string :status, null: false
      t.date :order_placed
      t.date :delivered_on
      t.boolean :slime
      t.reference :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
