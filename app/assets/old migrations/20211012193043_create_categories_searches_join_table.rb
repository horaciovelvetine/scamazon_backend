class CreateCategoriesSearchesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :searches do |t|
      t.index :category_id
      t.index :search_id
    end
  end
end
