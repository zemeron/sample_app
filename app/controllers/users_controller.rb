class UsersController < ApplicationController
  def new
  	@user = User.new
  	@title = "Sign up"
  end
  
  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to the sample app!"
      redirect_to user_path(@user)
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
