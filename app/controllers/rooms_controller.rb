class RoomsController < ApplicationController
  def index
    
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
