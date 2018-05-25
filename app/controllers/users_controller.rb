class UsersController < ApplicationController

def index
	@users = User.all
end  

def show
    @user = User.find(params[:id])
  end
  
  def new
  	@user = User.new
  end

def create
  debugger
    @user = User.new(params[:user])
    if @user.save
      flash.now[:success] = "Welcome to Airbnb!"
      debugger
      redirect_to (session[:return_to] || @user)
    else
      render 'new'
    end
  end
end
