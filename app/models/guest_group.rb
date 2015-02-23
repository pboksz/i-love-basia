class GuestGroup < ActiveRecord::Base
  has_many :guests, dependent: :destroy
end
