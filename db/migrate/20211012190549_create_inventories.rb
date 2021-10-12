class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :notes
      t.reference :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
