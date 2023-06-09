class CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @comment = Comment.new
  end

  def show
    @comments = Comment.all.where(review_id: @review.id).order(created_at: :desc)
  end

  def new
    @comment = Comment.new(comment_params)
    @comments = Comment.all.where(review_id: @review.id).order(created_at: :desc)
    @review = Review.friendly.find(params[:id])
    @review_id = @review.id
    @comment.save
  end

  def create
    @review = Review.friendly.find(params[:review_id])
    @comment = @review.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to @review }
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :c_nickname, :review_id)
    end

end
