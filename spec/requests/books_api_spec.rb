require 'rails_helper'

RSpec.describe Api::BooksController, type: :request do
  describe "Books API" do    
    it 'retrieves a specific book' do 
      book = create(:book)
      get "/api/books/#{book.id}"
      expect(response).to have_http_status(:success)
      
      hash_body = JSON.parse(response.body).with_indifferent_access

      expect(hash_body).to include({
        id: book.id,
        title: book.title,
        authors: book.authors.select('id', 'first_name', 'last_name').to_a.map(&:serializable_hash),
        summary: book.summary,
        year: book.year
      })
    end
    
    it 'creates a book' do 
      book = build(:book)
      post "/api/books", params: { book:  { title: book.title, summary: book.summary, year: book.year, pages: book.pages} }
      expect(response).to have_http_status(:created)
      expect(Book.find(JSON.parse(response.body)["id"])).to be_truthy
    end
  end
end
