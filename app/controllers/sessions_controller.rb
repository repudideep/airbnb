class SessionsController < ApplicationController

def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      #debugger
      redirect_back_or root_url
      # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    debugger
  	sign_out
    debugger
  	redirect_to root_url
  end

end
