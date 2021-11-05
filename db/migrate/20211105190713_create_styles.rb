class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :stock
      t.string :model_num, unique: true
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
    add_index :styles, :model_num, unique: true
  end
end
