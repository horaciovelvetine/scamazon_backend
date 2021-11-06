class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.decimal :rating, precision: 3, scale: 2
      t.integer :helpful, default: 0
      t.boolean :verified_pur, default: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
