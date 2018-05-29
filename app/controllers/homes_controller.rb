class HomesController < ApplicationController
  # before_filter :valid_date?

  # def valid_date?
  #   debugger
  #   from_date = params[:checkin_val]
  #   unless Chronic.parse(from_date)
  #     @errors = ActiveModel::Errors.new(self)
  #     erros.add = ('Invalid date')
  #     redirect_to root_url
  #   end
  # end

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
    #debugger
    # 
    # bookings = Booking.all(conditions: ["(bookings.to <= :start_date AND bookings.from >= :start_date) OR 
    #   (bookings.to <= :end_date AND bookings.from >= :end_date)",{start_date: from_date, end_date: to_date}])
      
      bookings = Booking.where("(\"bookings\".\"to\" >= :start_date AND \"bookings\".\"from\" <= :start_date)
             OR (\"bookings\".\"to\" >= :end_date AND \"bookings\".\"from\" <= :end_date)", {start_date: from_date, end_date: to_date})
  
      debugger
      if bookings.any?
        @homes= Home.where('place = ? AND id  NOT IN (?)',place, bookings.collect {|b| b.home_id }).paginate(page: params[:page])

       
      else
         @homes = Home.where('place=?',place).paginate(page: params[:page])
            end
      debugger
  		#@homes = Home.where('id NOT IN (?)',Home.joins(:bookings)).where(place: place)
  	#@homes = @homes.paginate(page: params[:page])
  end
end

