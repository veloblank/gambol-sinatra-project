class AddHasPendingPropsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_pending_picks, :boolean
    add_column :users, :pending_picks, :string, :default => []
  end
end
