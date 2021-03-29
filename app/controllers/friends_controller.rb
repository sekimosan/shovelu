class FriendsController < ApplicationController
  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = "ユーザーをフォローしました"
      redirect_to @user
    else
      flash.now[:alert] = "ユーザーをフォロー出来ませんでした"
      redeirect_to @user
    end    

  def destory
    following = current_user.unfollow(@user)
    if following.destory
      flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to @user
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_to @user
    end
  end

  private
  def
    @user = User.find(params[:friend][:follow_id])
  end
end  
