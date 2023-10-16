class AutosController < ApplicationController
  before_action :set_auto, only: %i[ show edit update destroy ]

  def index
    @autos = Auto.all.order(:brand)
  end

  def show
  end

  def new
    @auto = Auto.new
  end

  def edit
  end

  def create
    @auto = Auto.new(auto_params)
    if @auto.save
      redirect_to autos_path, notice: 'Auto was successfully created.'
    else
      flash.now[:alert] = 'Auto was not successfully created!'
      render :new
    end
  end

  def update
    if @auto.update(auto_params)
      redirect_to autos_path, notice: 'Auto was successfully updated.'
    else
      redirect_to autos_path, alert: 'Auto was not successfully updated.'
    end
  end

  def destroy
    @auto.destroy

    respond_to do |format|
      format.html { redirect_to autos_url, notice: "Auto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_auto
      @auto = Auto.find(params[:id])
    end

    def auto_params
      params.require(:auto).permit(:brand)
    end
end