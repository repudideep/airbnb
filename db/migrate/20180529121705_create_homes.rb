class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.string :place
      t.integer :price
      t.integer :occupancy

      t.timestamps
    end
  end
end
