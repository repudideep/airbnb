class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :store_location]
  before_filter :correct_user,   except: [:new, :create]



def show

    @user = User.find(params[:id])
    @bookings = @user.bookings.paginate(page: params[:page], :per_page => 5)
     #debugger
  end
  
  def new
  	@user = User.new
  end

def create
  #debugger
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to Airbnb!"
      #debugger
      redirect_to (session[:return_to] || root_url)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
