class AddShiftIdColumnToSignupModel < ActiveRecord::Migration
  def change
    add_column :signups, :shift_id, :integer
  end
end
