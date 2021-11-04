class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :sub_tot, precision: 10, scale: 2
      t.decimal :grand_tot, precision: 10, scale: 2
      t.decimal :shipping, precision: 10, scale: 2
      t.datetime :shipped_on
      t.boolean :slime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
