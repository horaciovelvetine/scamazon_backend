class ViewedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :viewed_items do |t|
      t.belongs_to :user
      t.belongs_to :item
      t.boolean :saved_for_later
    end

  end
end
