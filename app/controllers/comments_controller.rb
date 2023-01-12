class CommentsController < ApplicationController
  def index
    @comment = Comment.new
  end

  def show

  end

  def new
    @comment = Comment.new
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
