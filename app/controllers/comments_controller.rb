class CommentsController < ApplicationController
  def create

    if params[:comment][:content].blank?
     redirect_to prototype_path(params[:prototype_id]) and return
    end

    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,
      prototype_id: params[:prototype_id])
  end

end
