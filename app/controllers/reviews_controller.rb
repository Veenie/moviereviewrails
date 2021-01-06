class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update]
    before_action :review_auth, only: [:edit, :update]

    def show
    end

    def new
      @review = Review.new
    end

    def create
      @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to review_path(@review)
      else
        @errors = @review.errors.full_messages
        render :new
      end    
    end

    def edit
      @review = Review.find_by(id: params[:id])
      #redirect_to review_path(@review) if !@review || @review.user != current_user
    end

    def update
      if @review.update(review_params)
        redirect_to review_path(@review)
      else
        @errors = @review.errors.full_messages
        render :edit
      end
    end

    def destroy
      review = Review.find(params[:id])
      review.destroy
      redirect_to '/'
    end

    private

    def review_params
       params.require(:review).permit(:header, :body, :movie_id)
    end

    def set_review
      @review = Review.find_by(id: params[:id])
      if !@review
        flash[:message] = "Review not found"
        redirect_to '/'
      end  
    end

    def review_auth 
      if @review.user != current_user
        redirect_to '/'
        flash[:message] = "Unauthorized action"
      end
    end  

end