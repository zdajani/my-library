class Api::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]
  
  def show
    render json: @author.to_json(:include => {:books => { only: ['title', 'id']}})
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def author_params
    params.require(:book).permit(:first_name, :last_name, :books)
  end
end
