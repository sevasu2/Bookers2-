class UsersController < ApplicationController

	before_action :authenticate_user!

  def index
  	@users = User.all
    @user = current_user
  	@book = Book.new
  end

  def show
  	@book = Book.new
    @books = Book.all
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update(user_params)
  	redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private
  def corect_user
      user = User.find(params[:id])
      if current_user != user
        redirect_to users_path
      end
    end

  def user_params
  	params.require(:user).permit(:name, :introduction, :image)
  end
end
