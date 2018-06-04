class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :home_id
      t.integer :inmates
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
