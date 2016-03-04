class AddRequiredPositionsToMarshallShifts < ActiveRecord::Migration
  def change
    add_column :marshall_shifts, :required_people, :integer
  end
end
