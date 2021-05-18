class TopicsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_room
  before_action :move_to_top_page
  def index
    @topic = Topic.new 
    @topics = @room.topics.includes(:user)

  end
  def create
    @topic = @room.topics.new(topic_params)
    if @topic.save
      redirect_to room_topics_path(@room)
    else 
      @topics = @room.topics.includes(:user)
      render :index
    end
  end
  def show
    @topic = @room.topics.find(params[:id])
    @comments = @topic.comments.includes(:user)
    @comment = @topic.comments.new
  end  
  def destroy
    @topic = @room.topics.find(params[:id])
    @topic.destroy
    redirect_to room_topics_path(@room)
  end   
  
  private
  def topic_params
    params.require(:topic).permit(:title,:memo,:room_id).merge(user_id: current_user.id)
  end  
  def set_room
    @room = Room.find(params[:room_id])
  end  
  def move_to_top_page
    unless @room.users.include?(current_user)
      redirect_to root_path
    end  
  end  

end
