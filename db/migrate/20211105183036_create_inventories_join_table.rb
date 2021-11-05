class CreateInventoriesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :stores, :items, column_options:{ null: false, foreign_key: true} do |t|
      t.index [:store_id, :item_id]
      t.index [:item_id, :store_id]
    end
  end
end
