class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :query
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
