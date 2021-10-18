class CreateGiftCards < ActiveRecord::Migration[6.1]
  def change
    create_table :gift_cards do |t|
      t.bigint :code
      t.decimal :balance
      t.string :notes
      t.belongs_to :user

      t.timestamps
    end
  end
end
