class UsersController < ApplicationController
  def edit
  end
  def update
  end  
  def show
    @user = User.find(params[:id])
  end  

  def destroy
  end  

  def search
    @user = User.search(params[:user_name])  
  end

  
end
