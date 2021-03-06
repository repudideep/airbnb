class Home < ActiveRecord::Base
  attr_accessible :name, :occupancy, :place, :price
  has_many :bookings
  has_many :users, through: :bookings

  scope :unique_by_place, lambda { select('DISTINCT(place)') }

  
  # def self.vacant_homes(home)
  	# includes:(:bookings).
  	# references(:bookings).
  	# where.not(bookings:{home_id: home.id})

end
