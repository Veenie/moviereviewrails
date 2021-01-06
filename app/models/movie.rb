class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews


    scope :alpha, -> { order(:title) }


    def self.last
        byebug
        Movie.order.last
    end
end
