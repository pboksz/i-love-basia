class RemoveAssociatedGuestIdsFromGuests < ActiveRecord::Migration
  def change
    remove_column :guests, :associated_guest_ids, :text
  end
end
