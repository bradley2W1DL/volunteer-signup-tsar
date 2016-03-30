class Signup < ActiveRecord::Base
  belongs_to :shift
  has_many :messages

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
