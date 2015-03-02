class Guest < ActiveRecord::Base
  belongs_to :guest_group

  def last_name
    name.split(' ').last
  end
end
