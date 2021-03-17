class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    flash[:notice] = "Book was successfully created."
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    flash[:update] = "Book was successfully updated."
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    flash[:destroy] = "Book was successfully destroyed."
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
