class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @cars = policy_scope(Car)
  end

  def show
    @car = Car.find(params[:id])
    authorize @car
  end

  def new
    @car = current_user.cars.build
    authorize @car
  end

  def create
    @car = current_user.cars.build(car_params)
    authorize @car
    if @car.save
      redirect_to car_path(@car), notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def edit
    @car = current_user.cars.find(params[:id])
    authorize @car
  end

  def update
    @car = current_user.cars.find(params[:id])
    authorize @car
    if @car.update(car_params)
      redirect_to car_path(@car), notice: 'Your new car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car = current_user.cars.find(params[:id])
    authorize @car

    if @car.delete
      flash[:notice] = 'Your car was deleted successfully'
      redirect_to cars_path
    else
      flash[:errors] = @car.errors.full_messages
      redirect_to destroy_car_path
    end
  end

  private
  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production, :address, :price_per_day)
  end
end
