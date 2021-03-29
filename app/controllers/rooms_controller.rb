class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:user).order("created_at DESC")
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.create
  end
  def destory
  end        
end
