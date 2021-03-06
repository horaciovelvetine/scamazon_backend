class CreateItemsTagsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :tags, column_options: { null: false, foreign_key: true } do |t|
      t.index [:item_id, :tag_id]
      t.index [:tag_id, :item_id]
    end
  end
end
