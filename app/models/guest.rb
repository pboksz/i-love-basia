class Guest < ActiveRecord::Base
  serialize :associated_guest_ids, Array
end
