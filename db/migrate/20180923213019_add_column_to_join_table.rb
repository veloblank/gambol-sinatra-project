class AddColumnToJoinTable < ActiveRecord::Migration
  def change
    remove_column :betting_slip_props, :betting_slip_id
    add_column :betting_slip_props, :user_id, :integer

  end
end
