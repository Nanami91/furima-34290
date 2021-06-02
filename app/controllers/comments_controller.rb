class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to item_path(@comment.item)
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(@comment.item)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :item, :user_).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
