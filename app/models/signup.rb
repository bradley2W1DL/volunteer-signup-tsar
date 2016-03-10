class Signup < ActiveRecord::Base
  belongs_to :shift
  has_many :messages
end
