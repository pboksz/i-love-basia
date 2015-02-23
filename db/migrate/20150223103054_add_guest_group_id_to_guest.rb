class AddGuestGroupIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :guest_group_id, :integer
  end
end
