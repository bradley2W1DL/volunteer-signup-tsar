class Shift < ActiveRecord::Base
  has_many :signups

  def available_spots?
    # return true if not enough people have signed-up
    self.required_number - self.signups.count > 0
  end

  def spots_remaining
    self.required_number - self.signups.count
  end

  def self.available_shift_ids
    # returns an array of ids for shifts with spots left to fill
    ids = []
    all.each do |shift|
      ids << shift.id if shift.spots_remaining > 0
    end
    ids
  end

end
