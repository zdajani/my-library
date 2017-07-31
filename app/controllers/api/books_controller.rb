class Api::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  
  def show
    render json: @book.to_json(:include => {:authors => { only: ['first_name', 'last_name', 'id']}})
  end
  
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: api_books_url
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:title, :pages, :summary, :year, :authors)
  end
end
