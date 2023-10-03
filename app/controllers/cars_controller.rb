class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :colors, only: %i[ show new edit update destroy ]

  
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
  
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
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
    @car.destroy
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
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :year, :color, :price, :description, :auto_id)
    end

    
end