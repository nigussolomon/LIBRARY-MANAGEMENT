class StudentSerializer < ActiveModel::Serializer
  attributes :id, :user, :year, :semester
end
