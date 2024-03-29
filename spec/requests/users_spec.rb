require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) do
    {
      email: Faker::Internet.email,
      password_digest: Faker::Lorem.word,
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      user_id: Faker::Code.npi
    }
  end

  let(:invalid_attributes) do
    {
      email: nil,
      password_digest: Faker::Lorem.word,
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      user_id: Faker::Code.npi
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:user) }
      get users_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = create(:user)
      get user_url(user), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq user.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Commodity" do
        expect {
          post users_url,
              params: { user: valid_attributes }, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new commodity" do
        post users_url,
            params: { user: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Commodity" do
        expect {
          post users_url,
              params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new commodity" do
        post users_url,
            params: { user: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          email: Faker::Internet.email
        }
      }

      it "updates the requested commodity" do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        user.reload
        expect(new_attributes[:email]).to eq user.email
      end

      it "renders a JSON response with the commodity" do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the commodity" do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
