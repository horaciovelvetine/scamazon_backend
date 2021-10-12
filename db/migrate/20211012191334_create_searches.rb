class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :query, null: false
      t.belongs_to :user, optional: true

      t.timestamps
    end
  end
end
