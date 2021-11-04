class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :stock
      t.string :model_num
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
    add_index :styles, :model_num
  end
end
