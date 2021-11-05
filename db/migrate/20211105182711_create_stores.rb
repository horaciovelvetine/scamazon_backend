class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :email
      t.string :description
      t.string :logo
      t.string :industry
      t.string :mission_statement
      t.string :ein
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :stores, :name
  end
end
