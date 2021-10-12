class CreateGiftCards < ActiveRecord::Migration[6.1]
  def change
    create_table :gift_cards do |t|
      t.bigint :code, unique: true
      t.money :balance
      t.string :notes
      t.reference :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
