class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, unique: true
      t.belongs_to :item, null: true, foreign_key: true
      t.belongs_to :list, null: true, foreign_key: true

      t.timestamps
    end
    add_index :tags, :name
  end
end
