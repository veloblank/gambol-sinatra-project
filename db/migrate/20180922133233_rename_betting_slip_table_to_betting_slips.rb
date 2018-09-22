class RenameBettingSlipTableToBettingSlips < ActiveRecord::Migration
  def change
    rename_table :betting_slip, :betting_slips 
  end
end
