class CreateBettingSlipProps < ActiveRecord::Migration
  def change
    create_table :betting_slip_props do |t|
      t.integer :user_id
      t.integer :prop_id
    end
  end
end
