class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :def_add
      t.references :account
      t.references :store
      t.references :user

      t.timestamps
    end
  end
end
