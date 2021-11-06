class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name, null: false
      t.string :model, unique: true
      t.string :color
      t.string :material
      t.integer :quantity, null: false
      t.string :weight
      t.string :dimensions
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
    add_index :styles, :model_num
  end
end
