class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.decimal :rating, null: false
      t.boolean :verified_purchaser, null: true
      t.belongs_to :user, null: false
      t.belongs_to :item, null: false

      t.timestamps
    end
  end
end
