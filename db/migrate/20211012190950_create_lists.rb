class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
