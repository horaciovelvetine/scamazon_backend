class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :name
      t.decimal :balance, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
