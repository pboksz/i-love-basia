class Guest < ActiveRecord::Base
  validates :name, :attending, presence: true
end
