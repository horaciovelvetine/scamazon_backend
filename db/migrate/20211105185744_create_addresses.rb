class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :def_address
      t.belongs_to :user, null: true, foreign_key: true
      t.belongs_to :store, null: true, foreign_key: true
      t.belongs_to :account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
