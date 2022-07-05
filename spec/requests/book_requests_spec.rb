require 'rails_helper'

RSpec.describe "BookRequests", type: :request do
  let(:valid_attributes) do
    test_user = User.create({
      email: Faker::Internet.email,
      password_digest: Faker::Lorem.word,
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      user_id: Faker::Code.npi
    })

    {
      user_id: test_user[:id],
      title: Faker::Lorem.word,
      author: Faker::Name.name,
      publisher: Faker::Name.name,
      published_date: Faker::Date.backward(days: 80),
      category: Faker::Lorem.word,
      isbn: Faker::Code.isbn,
      status: "Pending"
    }
  end

  let(:invalid_attributes) do
    {
      user_id: nil,
      title: nil,
      author: nil,
      publisher: Faker::Name.name,
      published_date: Faker::Date.backward(days: 80),
      category: Faker::Lorem.word,
      isbn: Faker::Code.isbn,
      status: "Pending"
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:book_request) }
      get book_requests_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book_request = create(:book_request)
      get book_request_url(book_request), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq book_request.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Commodity" do
        expect {
          post book_requests_url,
              params: { book_request: valid_attributes }, as: :json
        }.to change(BookRequest, :count).by(1)
      end

      it "renders a JSON response with the new commodity" do
        post book_requests_url,
            params: { book_request: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Commodity" do
        expect {
          post book_requests_url,
              params: { book_request: invalid_attributes }, as: :json
        }.to change(BookRequest, :count).by(0)
      end

      it "renders a JSON response with errors for the new commodity" do
        post book_requests_url,
            params: { book_request: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: Faker::Lorem.word
        }
      }

      it "updates the requested commodity" do
        book_request = BookRequest.create! valid_attributes
        patch book_request_url(book_request),
              params: { book_request: new_attributes }, as: :json
        book_request.reload
        expect(new_attributes[:title]).to eq book_request.title
      end

      it "renders a JSON response with the commodity" do
        book_request = BookRequest.create! valid_attributes
        patch book_request_url(book_request),
              params: { book_request: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the commodity" do
        book_request = BookRequest.create! valid_attributes
        patch book_request_url(book_request),
              params: { book_request: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
