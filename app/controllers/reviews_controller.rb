class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :set_comments, only: [:new, :create]

  def index
    #puts message
    # Rails.logger.info "reached the index method"
    if params[:query].present?
      sql_query = <<~SQL
        reviews.title @@ :query
        OR reviews.content @@ :query
        OR reviews.category @@ :query
        OR reviews.subtitle @@ :query
        OR users.username @@ :query
        OR users.first_name @@ :query
        OR users.last_name @@ :query
      SQL
      @reviews = Review.joins(:user).where(sql_query, query: "%#{params[:query]}%")

    else
      @reviews = Review.all.recent
    end
  end

  def show
    @review = Review.friendly.find(params[:id])
    @comment = @review.comments.build
    @comments = Comment.all.where(review_id: @review.id).order(created_at: :desc)
    # record = relation.first
    # key = record.to_key
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
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @review }
        format.js
      else
        format.html { render 'reviews/show' }
      end
    end
  end

  def edit
    @review = Review.friendly.find(params[:id])
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
