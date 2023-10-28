class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to car_path(id: @comment.car_id)
    else
      flash.now[:alert] = 'Comment is not saved'
    end   
  end

  def edit
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to car_path(id: @comment.car_id)
    else
      flash.now[:alert] = 'Comment is not deleted'
    end


  end

  def destroy
    if @comment.destroy
      redirect_to car_path(id: @comment.car_id)
    else
      flash.now[:alert] = 'Comment is not deleted'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :car_id)
  end
  
end
