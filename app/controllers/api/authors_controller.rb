class Api::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]
  
  def index
    @authors = Author.all
    render json: @authors.to_json(:include => {:books => { only: ['title', 'id']}})
  end
  
  def show
    render json: @author.to_json(:include => {:books => { only: ['title', 'id']}})
  end
  
  def create
    @book = Book.find(params[:author][:book_id])
    @author = Author.new(author_params)

    if @author.save
      @author.books << @book
      render json: @author, status: :created, location: api_authors_url
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
