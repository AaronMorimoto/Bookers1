class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    #<%= form_with model: @book, url: update_book_path(@book.id), method: :patch do |f| %>
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path(@book)  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end