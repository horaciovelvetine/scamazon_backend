class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body
      t.string :helpful
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
