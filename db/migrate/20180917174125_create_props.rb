class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.string :title
      t.text :description
      t.decimal :odds, :precision => 3, :scale => 2
      t.decimal :risk, :precision => 3, :scale => 2
      t.decimal :reward, :precision => 3, :scale => 2
      t.timestamps null: false
    end
  end
end
