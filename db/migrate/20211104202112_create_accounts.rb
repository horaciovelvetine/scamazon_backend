class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :type
      t.string :number
      t.datetime :expires
      t.integer :redeem_code, unique: true
      t.string :name_on

      t.timestamps
    end
    add_index :accounts, :number, unique: true
  end
end
