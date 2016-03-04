class CreateMarshallShifts < ActiveRecord::Migration
  def change
    create_table :marshall_shifts do |t|
      t.string :shift_time
      t.timestamps null: false
    end
  end
end
