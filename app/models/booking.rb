class Booking < ActiveRecord::Base
  attr_accessible :from, :home_id, :inmates, :user_id
  belongs_to :user
  belongs_to :home
  
        validates :user_id, presence:true
        validates :home_id, presence:true

default_scope order: 'bookings.from DESC'
end