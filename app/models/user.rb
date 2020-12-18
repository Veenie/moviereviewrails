class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews
    has_secure_password #authenticate and validate pass
end
