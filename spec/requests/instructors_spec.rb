require 'rails_helper'

RSpec.describe "Instructors", type: :request do
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
      course: Faker::Lorem.word,
    }
  end

  let(:invalid_attributes) do
    {
      user_id: nil,
      course: nil,
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:instructor) }
      get instructors_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      instructor = create(:instructor)
      get instructor_url(instructor), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq instructor.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Commodity" do
        expect {
          post instructors_url,
              params: { instructor: valid_attributes }, as: :json
        }.to change(Instructor, :count).by(1)
      end

      it "renders a JSON response with the new commodity" do
        post instructors_url,
            params: { instructor: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Commodity" do
        expect {
          post instructors_url,
              params: { instructor: invalid_attributes }, as: :json
        }.to change(Instructor, :count).by(0)
      end

      it "renders a JSON response with errors for the new commodity" do
        post instructors_url,
            params: { instructor: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          course: Faker::Lorem.word
        }
      }

      it "updates the requested commodity" do
        instructor = Instructor.create! valid_attributes
        patch instructor_url(instructor),
              params: { instructor: new_attributes }, as: :json
        instructor.reload
        expect(new_attributes[:course]).to eq instructor.course
      end

      it "renders a JSON response with the commodity" do
        instructor = Instructor.create! valid_attributes
        patch instructor_url(instructor),
              params: { instructor: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the commodity" do
        instructor = Instructor.create! valid_attributes
        patch instructor_url(instructor),
              params: { instructor: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
