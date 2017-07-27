class Api::BooksController < ApplicationController
  def show
  #render json: @post.to_json(:only => [:id ] )
    @book = Book.find(params[:id])
      render json: @book.to_json(:include => {:authors => { only: ['first_name', 'last_name', 'id']}})

  end
  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_book
  #   @book = Book.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:title, :pages, :summary, :year, :authors)
  end
end
