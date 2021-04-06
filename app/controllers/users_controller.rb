class UsersController < ApplicationController
  
  def edit
  end
  def update
  end  
  def show
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end  
  end  

  def destroy
  end  

  def search
    @user = User.search(params[:user_name])  
  end

  
end
