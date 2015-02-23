class Guest < ActiveRecord::Base
  belongs_to :guest_group
  serialize :associated_guest_ids, Array
end
