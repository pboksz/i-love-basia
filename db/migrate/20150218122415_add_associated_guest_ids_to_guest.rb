class AddAssociatedGuestIdsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :associated_guest_ids, :text
  end
end
