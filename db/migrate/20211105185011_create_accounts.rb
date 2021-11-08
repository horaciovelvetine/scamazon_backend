class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :issued_by
      t.string :number, unique: true
      t.string :expires, :null => false
      t.string :name_on, null: false
      t.integer :ccv, null: false
      t.belongs_to :wallet, null: false, foreign_key: true

      t.timestamps
    end
    add_index :accounts, :number, unique: true
  end
end
