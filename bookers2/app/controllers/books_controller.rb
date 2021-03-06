class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:edit, :update, ]

  def new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    # books#show にいく
    redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
   end


  def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book_show = Book.new
  end

  def edit
      @book = Book.find(params[:id])
    # if @book.user == current_user
    #     render "edit"
    # else
    #     redirect_to books_path
    # end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
    render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  def correct_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
