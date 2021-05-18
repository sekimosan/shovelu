class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.find(params[:room_id])
    @topic = @room.topics.find(params[:topic_id])
    @comment = @topic.comments.new(comments_params)
    if @comment.save
      redirect_to room_topic_path(@room,@topic)
    else 
      render template: "topics/show"
      flash[:alert] = "コメントを保存できませんでした"
    end  
  end  

  private

  def comments_params
    params.require(:comment).permit(:content,:room_id,:topic_id).merge(user_id: current_user.id,room_id: @room.id, topic_id: @topic.id)
  end
end
