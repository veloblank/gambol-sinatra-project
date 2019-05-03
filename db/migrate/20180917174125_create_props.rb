class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.string :title
      t.text :description
      t.float :odds
      t.float :risk
      t.float :reward
      t.timestamps null: false
    end
  end
end
