class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.string :title
      t.text :description
      t.decimal :odds
      t.decimal :risk
      t.decimal :reward
      t.timestamps null: false
    end
  end
end
