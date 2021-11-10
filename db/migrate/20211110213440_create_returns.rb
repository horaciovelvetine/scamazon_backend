class CreateReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :returns do |t|
      t.decimal :refund_amount, precision: 10, scale: 2
      t.decimal :sub_total, precision: 10, scale: 2
      t.boolean :slime
      t.string :cause
      
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :status, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
