class Review < ApplicationRecord
  validates :header, presence: true, uniqueness: true
  validates :body, presence: true
  belongs_to :user
  belongs_to :movie
  validate :too_many

  def too_many
    #find reviews from today, use to_date to get correct comparrison, using try to get 'nil' if error calling to_date
    reviews_today = user.reviews.select do |r|
      r.created_at.try(:to_date) ==  Date.today
    end

    if reviews_today.size > 2
      errors.add(:review_id, "can't post more than 3 times a day")
    end  
  end

  
end
