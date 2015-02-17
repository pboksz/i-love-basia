class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.boolean :attending
      t.text :comments

      t.timestamps null: false
    end
  end
end
