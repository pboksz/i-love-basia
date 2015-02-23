class MoveCommentsToGuestGroup < ActiveRecord::Migration
  def change
    remove_column :guests, :comments, :text
    add_column :guest_groups, :comments, :text
  end
end
