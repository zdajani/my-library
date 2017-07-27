require 'rails_helper'

RSpec.describe Api::BooksController, type: :api do
  
  describe "Books API" do
  
  let(:book) { create(:book) }
    it 'retrieves a specific book' do 
      get "api/books/#{book.id}",:formate =>:json
      expect(last_response.status).to eql(200)
      hash_body = JSON.parse(last_response.body).with_indifferent_access
  
      expect(hash_body).to include({
        id: book.id,
        title: book.title,
        authors: book.authors.select('id', 'first_name', 'last_name').to_a.map(&:serializable_hash),
        summary: book.summary,
        year: book.year
      })
    end
  end
end
