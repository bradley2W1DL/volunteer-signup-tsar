class Shift < ActiveRecord::Base
  has_many :signups

  def available_spots?
    # return true if not enough people have signed-up
    self.required_number - self.signups.count > 0
  end

  def spots_remaining
    self.required_number - self.signups.count
  end
end
