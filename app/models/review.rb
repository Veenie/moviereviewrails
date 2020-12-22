class Review < ApplicationRecord
  validates :header, presence: true
  validates :body, presence: true
  belongs_to :user
  belongs_to :movie
end
