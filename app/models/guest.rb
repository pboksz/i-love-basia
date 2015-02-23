class Guest < ActiveRecord::Base
  belongs_to :guest_group
end
