require 'rails_helper'

RSpec.describe "BookLoans", type: :request do
  let(:valid_attributes) do

    test_user = User.create({
      email: Faker::Internet.email,
      password_digest: Faker::Lorem.word,
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      user_id: Faker::Code.npi
    })

    test_book = Book.create({
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
    })

    {
      user_id: test_user[:id],
      book_id: test_book[:id],
      due_date: Faker::Date.forward(days: 0),
      loan_date: Faker::Date.forward(days: 15),
      status: "Return",
    }
  end

  let(:invalid_attributes) do
    {
      user: nil,
      book: nil,
      due_date: Faker::Date.forward(days: 0),
      loan_date: Faker::Date.forward(days: 15),
      status: "Return",
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times {create(:book_loan)}
      get book_loans_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book_loan = create(:book_loan)
      get book_loan_url(book_loan), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq book_loan.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Commodity" do
        expect {
          post book_loans_url,
              params: { book_loan: valid_attributes }, as: :json
        }.to change(BookLoan, :count).by(1)
      end

      it "renders a JSON response with the new commodity" do
        post book_loans_url,
            params: { book_loan: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Commodity" do
        expect {
          post book_loans_url,
              params: { book_loan: invalid_attributes }, as: :json
        }.to change(BookLoan, :count).by(0)
      end

      it "renders a JSON response with errors for the new commodity" do
        post book_loans_url,
            params: { book_loan: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          due_date: Faker::Date.forward(days: 2),
        }
      }

      it "updates the requested commodity" do
        book_loan = BookLoan.create! valid_attributes
        patch book_loan_url(book_loan),
              params: { book_loan: new_attributes }, as: :json
        book_loan.reload
        expect(new_attributes[:due_date]).to eq book_loan.due_date
      end

      it "renders a JSON response with the commodity" do
        book_loan = BookLoan.create! valid_attributes
        patch book_loan_url(book_loan),
              params: { book_loan: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the commodity" do
        book_loan = BookLoan.create! valid_attributes
        patch book_loan_url(book_loan),
              params: { book_loan: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
