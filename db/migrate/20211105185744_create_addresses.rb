class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :unit
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.boolean :def_address, default: false
      t.belongs_to :user, null: true, foreign_key: true
      t.belongs_to :store, null: true, foreign_key: true
      t.belongs_to :account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
