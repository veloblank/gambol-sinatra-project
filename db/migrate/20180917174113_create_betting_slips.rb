class CreateBettingSlips < ActiveRecord::Migration
  def change
    create_table :betting_slip do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
