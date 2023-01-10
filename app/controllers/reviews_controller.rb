class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :set_comments, only: [:new, :create]

  def index
    if params[:query].present?
      sql_query = <<~SQL
        review.title @@ :query
        OR review.city @@ :query
        OR review.category @@ :query
        OR review.duration @@ :query
      SQL
      @reviews = Review.where(sql_query, query: "%#{params[:query]}%")
    else
      @reviews = Review.all.recent
    end
  end

  def show
    @review = Review.friendly.find(params[:id])
    @comments = Comment.all.where(review_id: @review.id)
  end

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
    @review = Review.find(params[:id])
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
