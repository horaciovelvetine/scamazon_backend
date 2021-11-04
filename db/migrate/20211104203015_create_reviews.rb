class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.decimal :rating, precision: 3, scale: 2
      t.integer :helpful
      t.boolean :verified_purchase
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
