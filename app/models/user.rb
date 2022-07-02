class User < ApplicationRecord
    validates :email, :password_digest, :first_name, :last_name, :user_id, presence: true
    validates :email, :user_id, uniqueness: true
end
