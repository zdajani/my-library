require 'rails_helper'

RSpec.describe Api::AuthorsController, type: :request do
  describe "Books API" do    
    it 'retrieves a specific author' do 
      author = create(:author)
      get "/api/authors/#{author.id}"
      
      expect(response).to have_http_status(:success)
      
      hash_body = JSON.parse(response.body).with_indifferent_access

      expect(hash_body).to include({
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name,
        books: author.books.select('id', 'title').to_a.map(&:serializable_hash),
      })
    end
  end
end
