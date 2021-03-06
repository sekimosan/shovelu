class RoomsController < ApplicationController
  before_action :authenticate_user!,except: :index
  def index
    @rooms = Room.includes(:user).order("created_at DESC")
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_topics_path(@room)
    else
      render :new  
    end  
  end
  def destroy
    room = Room.find(params[:id])
    unless room.users.include?(current_user)
      redirect_to root_path
    end
    room.destroy
    redirect_to root_path
    
  end       

  private
  def room_params
    params.require(:room).permit(:name,user_ids: [])
  end  
end
