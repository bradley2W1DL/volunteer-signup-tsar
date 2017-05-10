class AddDisplayOrderToShift < ActiveRecord::Migration
  def change
    add_column :shifts, :display_order, :integer
  end
end
