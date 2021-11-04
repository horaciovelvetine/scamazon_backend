class CreateSeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :seeds do |t|

      t.timestamps
    end
  end
end
