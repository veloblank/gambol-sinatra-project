class RevertChangeTableAttributes < ActiveRecord::Migration
  def change
    remove_column :betting_slip_props, :user_id
    add_column :betting_slip_props, :betting_slip_id, :integer
  end
end
