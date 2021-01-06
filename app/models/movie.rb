class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews


    scope :alpha, -> { order(:title) }

    def self.latest
        #byebug
        Movie.order(:year).last
    end


end
