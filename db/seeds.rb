# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Role.destroy_all
# give myself admin role
admin = Role.create(name: 'admin')
user = User.where(email: 'bradley.s.berger@gmail.com').first

if user && !user.admin?
  user.roles << admin
  user.save!
end

# Create all necessary Shifts
Shift.create(name: 'Deliver Notice Letters', shift_time: '8/14/16 5-6:30pm', required_number: 4, shift_type: 'other')
Shift.create(name: 'Place No Parking Signs', shift_time: '8/20 5p-8p', required_number: 4, shift_type: 'other')
Shift.create(name: 'Pre-Race Setup', shift_time: '5p-7p 8/20', required_number: 8, shift_type: 'setup')
Shift.create(name: 'Race Day Setup', shift_time: '5:30am 8/21', required_number: 12, shift_type: 'setup')
Shift.create(name: 'Registration A', shift_time: '6:15a-10:15am', required_number: 5, shift_type: 'registration')
Shift.create(name: 'Registration B', shift_time: '10:15am-2:15pm', required_number: 5, shift_type: 'registration')
Shift.create(name: 'Registration C', shift_time: '2:15pm-6:15pm', required_number: 6, shift_type: 'registration')
Shift.create(name: 'Race Marshall A', shift_time: '7:15am-11:15am', required_number: 18, shift_type: 'marshall')
Shift.create(name: 'Race Marshall B', shift_time: '11:15am-3:15pm', required_number: 18, shift_type: 'marshall')
Shift.create(name: 'Race Marshall C', shift_time: '3:15pm-7:05pm', required_number: 18, shift_type: 'marshall')
Shift.create(name: 'Race Day Course Breakdown', shift_time: '6:40pm-8pm (may finish sooner)', required_number: 12, shift_type: 'breakdown')
Shift.create(name: 'Day-After Race Breakdown', shift_time: '8/22/16 8am-11am', required_number: 4, shift_type: 'breakdown')