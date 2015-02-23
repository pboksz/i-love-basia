class CreateGuestGroups < ActiveRecord::Migration
  def change
    create_table :guest_groups do |t|
      t.timestamps null: false
    end
  end
end
