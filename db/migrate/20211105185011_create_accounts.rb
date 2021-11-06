class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :type
      t.string :number, unique: true
      t.datetime :expires, :null => false
      t.string :name_on, null: false
      t.integer :security_code, null: false

      t.timestamps
    end
    add_index :accounts, :number, unique: true
  end
end
