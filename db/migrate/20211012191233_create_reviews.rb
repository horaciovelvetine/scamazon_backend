class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.decimal :rating, null: false
      t.boolean :verified_purchaser
      t.reference :item, null: false, foreign_key: true
      t.reference :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
