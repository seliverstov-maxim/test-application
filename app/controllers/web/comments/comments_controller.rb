class Web::Comments::CommentsController < Web::Comments::ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.owner = current_user

    if @comment.save
      redirect_to :back
    else
      redirect_to :back, alert: @comment.errors.full_messages.uniq.first
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end