class RemoveColumnPendingPicksFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pending_picks
  end
end
