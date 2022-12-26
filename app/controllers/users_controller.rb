class UsersController < ApplicationController

 def show
  @user= User.find(params[:id])
  @books= @user.books
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user)
  else
    render:show
  end
 end


 def index
  @book=Book.new
   @user = current_user
  @users= User.all
 end


private
 def user_params
 params.require(:user).permit(:name,:introduction, :profile_image)
 end
end