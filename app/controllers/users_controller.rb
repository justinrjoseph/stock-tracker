class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
  
  def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end
  
  def friends
    @friendships = current_user.friends
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend: @friend)
    
    if current_user.save
      redirect_to my_friends_path, notice: "You are now friends with #{@friend.full_name}."
    else
      redirect_to my_friends_path, error: "There was a problem creating your friendship with #{@friend.full_name}."
    end
  end
  
  def search
    @users = User.search(params[:search_param])
    
    if @users
      @users = current_user.except_current_user(@users)
      render partial: 'friends/lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end