class CarsController < ApplicationController
  before_action :colors, only: %i[ show new edit update destroy ]

  load_and_authorize_resource
  # GET /cars or /cars.json
  def index
    if params[:auto_id].present?
      @cars = Auto.find_by(id: params[:auto_id]).cars
    else
      @cars = Car.all
    end
  end

  # GET /cars/1 or /cars/1.json
  def show
    find_replies_for_comment

    @comments = Comment.where(car_id: @car.id).order(id: :desc)
  end

  # GET /cars/new
  def new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car.user_id = current_user.id
      if @car.save
        redirect_to cars_path, notice: 'Car was successfully created.'
      else
        flash.now[:alert] = 'Car was not successfully created!'
        render :new
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Car was successfully updated.'
    else
      redirect_to cars_path, alert: 'Car was not successfully updated.'
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    if @car.destroy
      redirect_to cars_path, notice: 'Car was successfully destroyed.'
    else
      redirect_to cars_path, alert: 'Car was not successfully destroyed.'
    end
  end
 
  def colors
    @colors = ["Black", "White", "Silver", "Gray", "Red", "Blue", "Green", "Gold", "Brown", "Orange", "Yellow", "Purple"]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
   

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :year, :color, :price, :description, :auto_id, :user_id)
    end

    def find_replies_for_comment
      @car = Car.find(params[:id])
      @comments = Comment.where(car_id: @car.id).order(id: :desc)
      @replies = []

      @comments.each do |comment|
        @replies += Reply.where(comment_id: comment.id)
      end
    end    
end
