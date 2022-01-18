class ReviewController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.package = Package.find(params[:id])
    if @review.save
      redirect_to review_confirmation_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :content)
  end

end
