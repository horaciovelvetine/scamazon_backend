class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :tracking_info
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
    add_index :statuses, :name
  end
end
