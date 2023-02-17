class CommentsController < ApplicationController
  def index
    @comment = Comment.new
  end

  def show
    @comments = Comment.all.where(review_id: @review.id).order(created_at: :desc)
  end

  def new
    @comment = Comment.new
    @comments = Comment.all.where(review_id: @review.id).order(created_at: :desc)
    @review = Review.friendly.find(params[:id])
    @review_id = @review.id
  end

  def create
    @comment = Comment.new(comment_params)
  if @comment.save
    redirect_to review_path(@review)
  else
    render :new, status: :unprocessable_entity
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :c_nickname, :review_id)
    end

end
