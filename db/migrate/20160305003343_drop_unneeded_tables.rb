class DropUnneededTables < ActiveRecord::Migration
  def change
    drop_table :registration_shifts
    drop_table :marshall_shifts
  end
end
