class FriendshipsController < ApplicationController
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    redirect_to my_friends_path, notice: "You are no longer friends with #{@friendship.friend.full_name}."
  end 
end