class BooksController < ApplicationController

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
    @book.save
    # books#show にいく
    redirect_to book_path(@book)
   end


  def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book_show = Book.new
  end

  def edit
      @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
