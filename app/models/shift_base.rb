class ShiftBase < ActiveRecord::Base
  self.abstract_class = true

  def self.available_shifts
    # broken: want to return any shifts where the required number of volunteers is greater than
    # the number of signups for that Shift.  Essentially shifts that aren't already filled up.
    self.joins(:signups).where(:required_people > self.signups)
  end
end