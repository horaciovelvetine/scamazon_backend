class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, unique: true
      t.string :description
      t.decimal :rating, precision: 3, scale: 2, default: 0.0
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :inventory, null: false, foreign_key: true

      t.timestamps
    end
    add_index :items, :name
  end

end
