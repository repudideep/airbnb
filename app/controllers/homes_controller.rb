class HomesController < ApplicationController


  def show
    @place = params[:place]
  	@from_date = params[:checkin_val]
  	@to_date = params[:checkout_val]
    @adults = params[:adults]
    @children = params[:children]
    session[:inmates] = @adults.to_i + @children.to_i
  	session[:from_date]=@from_date
  	session[:to_date]=@to_date


    debugger

    bookings = Booking.all(conditions: ["(bookings.to >= :start_date AND bookings.from <= :start_date) OR 
      (bookings.to >= :end_date AND bookings.from <= :end_date)",{start_date: @from_date, end_date: @to_date}])
      
      #bookings = Booking.where("(\"bookings\".\"to\" >= :start_date AND \"bookings\".\"from\" <= :start_date)
            # OR (\"bookings\".\"to\" >= :end_date AND \"bookings\".\"from\" <= :end_date)", {start_date: from_date, end_date: to_date})
  

      if bookings.any?
        @homes= Home.where('place = ? AND id  NOT IN (?)',@place, bookings.collect {|b| b.home_id }).paginate(page: params[:page], :per_page => 1)

       
      else

         @homes = Home.where('place=?',@place).paginate(:page => params[:page], :per_page => 1)
         debugger
            end

  end
end

