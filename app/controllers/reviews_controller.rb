class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in




    def index
      if params[:movie_id] && @movie = Movie.find_by(params[:movie_id])
        @reviews = @movie.reviews
      else
        @error = "Movie not found" if params[:movie_id]
        @reviews = Review.all
      end
    end

    def show
      @review = Review.find_by(id: params[:id])
    end

    def new
      @review = Review.new
    end

    def create
      @review = current.user.reviews.build(review_params)
      if @review.save
        redirect_to review_path(@review)
      else
        render :new
      end    
    end

    def edit
      @review = Review.find_by(id: params[:id])
    end

    def update
      @review = Review.find_by(id: params[:id])
      @review.update(review_params)
      redirect_to review_path(@review)
    end

    def delete
      review = Review.find_by(id: params[:id])
      review.destroy
      redirect to '/reviews'
    end

    private

    def review_params
       params.require(:review).permit(:header, :body)
    end

end
