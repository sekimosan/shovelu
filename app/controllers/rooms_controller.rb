class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:user).order("created_at DESC")
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new  
    end  
  end
  def destory
    @room = Room.find(params[:id])
    unless @room.users.include?(current_user)
      redirect_to root_path
    end
    @room.destroy
    redirect_to root_path
  end       

  private
  def room_params
    params.require(:room).permit(:name,user_ids: [])
  end  
end
