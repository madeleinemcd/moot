class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :edit, :update, :destroy]

  # before_action :set_comments, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.comment = @comment
    if @review.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to review_path(@review)
  end

  private

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  def review_params
    params.require(:review).permit(:content, :title, :user)
  end
end
