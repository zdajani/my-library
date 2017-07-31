require 'rails_helper'

RSpec.describe Api::AuthorsController, type: :request do
  describe "Books API" do    
    it 'retrieves a specific author' do 
      author = create(:author_with_book)
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
    
    it 'creates an author with a book' do 
      book = create(:book)
      author = build(:author)
      post "/api/authors", params: { author:  { first_name: author.first_name, last_name: author.last_name, book_id: book.id } }
    
      expect(response).to have_http_status(:created)
      created_author = Author.find(JSON.parse(response.body)["id"])
      expect(created_author).to be_truthy
    
      expect(created_author.books.exists?(id: [book.id])).to be_truthy
    end
  end
end
