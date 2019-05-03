class CreateBettingSlipPropsTable < ActiveRecord::Migration
  def change
    create_table :betting_slip_props do |t|
      t.integer :betting_slip_id
      t.integer :prop_id
    end
  end
end
