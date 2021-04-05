class TopicsController < ApplicationController
  before_action :set_room
  def index
    @topic = Topic.new 
    @topics = @room.topics.includes(:user)

  end
  def create
    @topic = @room.topics.new(topic_params)
    binding.pry
    if @topic.save
      redirect_to room_topics_path(@room)
    else 
      @topics = @room.topics.includes(:user)
      render :index
    end  
  end
  def show
    @topic = @room.topics.find(params[:id])
  end  
  def destroy
    @topic = @room.topic(params[:id]).destroy
    redirect_to room_topics_path(@room)
  end   
  
  private
  def topic_params
    params.require(:topic).permit(:title,:memo,:room_id).merge(user_id: current_user.id)
  end  
  def set_room
    @room = Room.find(params[:room_id])
  end  

end
