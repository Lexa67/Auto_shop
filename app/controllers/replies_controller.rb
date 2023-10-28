class RepliesController < ApplicationController
  load_and_authorize_resource

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      redirect_to car_path(id: @reply.comment.car_id)
    else
      flash.now[:alert] = 'Reply is not saved'
    end   
  end

  def edit
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def update
    if @reply.update(reply_params)
      redirect_to car_path(id: @reply.comment.car_id)
    else
      flash.now[:alert] = 'Reply is not deleted'
    end


  end

  def destroy
    if @reply.destroy
      redirect_to car_path(id: @reply.comment.car_id)
    else
      flash.now[:alert] = 'Reply is not deleted'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :user_id, :comment_id)
  end
end
