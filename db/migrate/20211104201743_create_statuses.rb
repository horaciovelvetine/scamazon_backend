class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :track_info
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
    add_index :statuses, :name
  end
end
