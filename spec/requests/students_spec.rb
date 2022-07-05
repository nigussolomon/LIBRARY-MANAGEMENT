require 'rails_helper'

RSpec.describe "Students", type: :request do
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
      year: Faker::Date.forward(days: 0),
      semester: 1
    }
  end

  let(:invalid_attributes) do
    {
      user_id: nil,
      year: nil,
      semester: 1
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:student) }
      get students_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      student = create(:student)
      get student_url(student), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq student.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Commodity" do
        expect {
          post students_url,
              params: { student: valid_attributes }, as: :json
        }.to change(Student, :count).by(1)
      end

      it "renders a JSON response with the new commodity" do
        post students_url,
            params: { student: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Commodity" do
        expect {
          post students_url,
              params: { student: invalid_attributes }, as: :json
        }.to change(Student, :count).by(0)
      end

      it "renders a JSON response with errors for the new commodity" do
        post students_url,
            params: { student: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          year: Faker::Date.forward(days: 10)
        }
      }

      it "updates the requested commodity" do
        student = Student.create! valid_attributes
        patch student_url(student),
              params: { student: new_attributes }, as: :json
        student.reload
        expect(new_attributes[:year]).to eq student.year
      end

      it "renders a JSON response with the commodity" do
        student = Student.create! valid_attributes
        patch student_url(student),
              params: { student: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the commodity" do
        student = Student.create! valid_attributes
        patch student_url(student),
              params: { student: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
