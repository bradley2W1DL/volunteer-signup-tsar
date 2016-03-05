class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :name
      t.string :shift_time
      t.integer :required_number
      t.string :type

      t.timestamps null: false
    end
  end
end
