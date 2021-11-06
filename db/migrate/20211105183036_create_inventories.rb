class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :description
      t.belongs_to :store, null: true, foreign_key: true
    end
  end
end
