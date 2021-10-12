class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name, unique: true
      t.string :description
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
