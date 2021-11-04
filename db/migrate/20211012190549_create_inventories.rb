class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :notes
      t.belongs_to :store

      t.timestamps
    end
  end
end
