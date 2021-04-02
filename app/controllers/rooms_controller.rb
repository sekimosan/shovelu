class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:user).order("created_at DESC")
  end
  def new
    @room = Room.new
  end
  def create
    binding.pry
    @room = Room.create
  end
  def destory
  end        
end
