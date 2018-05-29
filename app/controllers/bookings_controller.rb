class BookingsController < ApplicationController
before_filter :signed_in_user, only: [:book]
	def book
		debugger
		@booking = Booking.new
		user = current_user
		home =     session[:home]
		#debugger
		@booking.user_id=user.id
		@booking.home_id=home.id
		@booking.from = session[:from_date]
		@booking.to = session[:to_date]
		@booking.inmates = session[:inmates]
		home_details = Home.select("name,place").where(id: home)
		#debugger
		home_name = home_details[0].name
		home_place = home_details[0].place
		@booking.save
		#debugger
		
		flash.now[:success] = "Congratulations! "+home_name+" - "+home_place+" booked successfully!"
		
	end
end
