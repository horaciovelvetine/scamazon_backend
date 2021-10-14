class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.decimal :rating
      t.boolean :verified_purchaser, null: true
      t.belongs_to :user
      t.belongs_to :item

      t.timestamps
    end
  end
end
