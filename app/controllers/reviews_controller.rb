class ReviewsController < ApplicationController

    def show
      @review = Review.find_by(id: params[:id])
      redirect_to '/' if !@review
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
      redirect_to review_path(@review) if !@review || @review.user != current_user
    end

    def update
      @review = Review.find_by(id: params[:id])
      redirect_to review_path(@review) if !@review || @review.user != current_user
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

end
