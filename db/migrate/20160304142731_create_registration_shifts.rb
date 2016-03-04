class CreateRegistrationShifts < ActiveRecord::Migration
  def change
    create_table :registration_shifts do |t|
      t.string :shift_time
      t.integer :required_people

      t.timestamps null: false
    end
  end
end
