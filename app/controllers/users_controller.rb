class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
 

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @user_info = @user
    @book_new = Book.new
  end
  def edit
    @user = User.find(params[:id])
    @book_new = Book.new
  end
  def index
    @user = User.all
    @user_info = current_user
    @book_new = Book.new
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end
end
