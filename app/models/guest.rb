class Guest < ActiveRecord::Base
  belongs_to :guest_group
  serialize :associated_guest_ids, Array

  def attending?
    case attending
      when true; 'Yes'
      when false; 'No'
      else; 'No Response'
    end
  end
end
