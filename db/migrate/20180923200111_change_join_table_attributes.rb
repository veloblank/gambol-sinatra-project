class ChangeJoinTableAttributes < ActiveRecord::Migration
  def change
    add_column :betting_slip_props, :betting_slip_id, :integer
    remove_column :betting_slip_props, :user_id
  end
end
