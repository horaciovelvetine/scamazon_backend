class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, unique: true
      t.string :email
      t.string :address
      t.string :description
      t.string :logo
      t.string :industry
      t.string :mission_statement
      t.bigint :ein, unique: true
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
