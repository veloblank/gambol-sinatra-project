class AddColumnUserIdToUserProps < ActiveRecord::Migration
  def change
    add_column :user_props, :user_id, :integer
    remove_column :user_props, :betting_slip_id
  end
end
