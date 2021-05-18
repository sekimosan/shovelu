class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room_topic
  before_action :move_to_top_page

  def create
    @comment = @topic.comments.new(comments_params)
    if @comment.save
      redirect_to room_topic_path(@room,@topic)
    else 
      render template: "topics/show"
      flash[:alert] = "コメントを保存できませんでした"
    end  
  end  

  def destroy
    comment = @topic.comments.find(params[:id])
    if comment.destroy
      redirect_to room_topic_path(@room,@topic)
    else
      redirect_to room_topic_path(@room,@topic)
      flash[:alert] = "コメントを削除できませんでした" 
    end  
  end  

  private
  
  def comments_params
    params.require(:comment).permit(:content,:room_id,:topic_id).merge(user_id: current_user.id,room_id: @room.id, topic_id: @topic.id)
  end
  def set_room_topic
    @room = Room.find(params[:room_id])
    @topic = @room.topics.find(params[:topic_id])
  end  
  def move_to_top_page
    unless @room.users.include?(current_user)
      redirect_to root_path
    end  
  end  
end
