class AddDisplayOrderToShift < ActiveRecord::Migration
  def change
    add_column :shifts, :order, :integer
  end
end
