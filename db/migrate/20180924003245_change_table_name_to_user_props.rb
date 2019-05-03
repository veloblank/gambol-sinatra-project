class ChangeTableNameToUserProps < ActiveRecord::Migration
  def change
    rename_table :betting_slip_props, :user_props
  end
end
