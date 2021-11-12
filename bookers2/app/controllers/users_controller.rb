class UsersController < ApplicationController

  def index
    @user = current_user
    @user = User.all
    @book = Book.new
    @book = Book.all
  end

  def show
    @user = User.find(params[:id])
    # @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
