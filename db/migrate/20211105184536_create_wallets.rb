class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :name, default: ''
      t.decimal :balance, precision: 10, scale: 2, default: 0.0
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
