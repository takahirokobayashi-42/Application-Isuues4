class BooksController < ApplicationController
   before_action :correct_book, only: [:edit]

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path
      else
        render "edit"
      end
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book_new)

    else
      @user_info = current_user
      @books = Book.all
      render "index"
    end
  end

  def index
    @books = Book.all
    @user_info = current_user
    @book_new = Book.new
  end


  def show
    @post_book = Book.find(params[:id])
    @book_new = Book.new
    @user_info = User.find(@post_book.user.id)
    @book_comment = BookComment.new
  end

  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    if @post_book.destroy
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      redirect_to books_path
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end
end
