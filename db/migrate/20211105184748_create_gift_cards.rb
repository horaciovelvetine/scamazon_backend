class CreateGiftCards < ActiveRecord::Migration[6.1]
  def change
    create_table :gift_cards do |t|
      t.string :redeem_code
      t.string :notes, default: ""
      t.decimal :amount, precision: 7, scale: 2
      t.belongs_to :wallet, null: false, foreign_key: true

      t.timestamps
    end
    add_index :gift_cards, :redeem_code
  end
end
