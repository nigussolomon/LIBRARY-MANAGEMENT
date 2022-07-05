require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:valid_attributes) do
    {
      book_code: Faker::Code.npi,
      title: Faker::Lorem.word,
      author: Faker::Name.name,
      publisher: Faker::Name.name,
      published_date: Faker::Date.backward(days: 80),
      category: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      copy: 1,
      isbn: Faker::Code.isbn,
      status: "Available"
    }
  end

  let(:invalid_attributes) do
    {
      book_code: nil,
      title: Faker::Lorem.word,
      author: Faker::Name.name,
      publisher: Faker::Name.name,
      published_date: Faker::Date.backward(days: 80),
      category: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      copy: nil,
      isbn: Faker::Code.isbn,
      status: "Available"
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:book) }
      get books_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book = create(:book)
      get book_url(book), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq book.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Commodity" do
        expect {
          post books_url,
              params: { book: valid_attributes }, as: :json
        }.to change(Book, :count).by(1)
      end

      it "renders a JSON response with the new commodity" do
        post books_url,
            params: { book: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Commodity" do
        expect {
          post books_url,
              params: { book: invalid_attributes }, as: :json
        }.to change(Book, :count).by(0)
      end

      it "renders a JSON response with errors for the new commodity" do
        post books_url,
            params: { book: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          author: Faker::Name.name
        }
      }

      it "updates the requested commodity" do
        book = Book.create! valid_attributes
        patch book_url(book),
              params: { book: new_attributes }, as: :json
        book.reload
        expect(new_attributes[:author]).to eq book.author
      end

      it "renders a JSON response with the commodity" do
        book = Book.create! valid_attributes
        patch book_url(book),
              params: { book: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the commodity" do
        book = Book.create! valid_attributes
        patch book_url(book),
              params: { book: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
