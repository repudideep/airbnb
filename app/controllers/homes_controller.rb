class HomesController < ApplicationController
  def show
    place = params[:place]
  	@user = current_user
  	from_date = params[:checkin_val]
  	to_date = params[:checkout_val]
    adults = params[:adults]
    children = params[:children]
    session[:inmates] = adults.to_i + children.to_i
  	session[:from_date]=from_date
  	session[:to_date]=to_date
    debugger
    bookings = Booking.where('(to >= ? AND from <= ?) OR (from <= ? AND to >= ? )',from_date,from_date,to_date,to_date)
    debugger
  		@homes= Home.where('place = ? AND id NOT IN (?)',place,Home.joins(:bookings))
  		#@homes = Home.where('id NOT IN (?)',Home.joins(:bookings)).where(place: place)
  	#@homes = @homes.paginate(page: params[:page])
  end
end
