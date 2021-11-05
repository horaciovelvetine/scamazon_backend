class CreateListsTagsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tags, :lists, column_options:{ null: false, foreign_key: true} do |t|
      t.index [:tag_id, :list_id]
      t.index [:list_id, :tag_id]
    end
  end
end
