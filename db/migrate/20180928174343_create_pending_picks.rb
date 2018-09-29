class CreatePendingPicks < ActiveRecord::Migration
  def change
    create_table :pending_picks do |t|
      t.integer :user_id
      t.integer :prop_id
    end
  end
end
