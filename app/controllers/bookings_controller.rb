class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :process_date_range, only: [:create, :update]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = current_user.bookings.build
    authorize @booking
  end

  def edit
    @booking = current_user.bookings.find(params[:id])
    authorize @booking
  end

  def create
    # starts_at, ends_at = params[:booking][:date_range].split(" to ")
    # process_date_range
    @booking = current_user.bookings.build(booking_params)
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking request has been sent.'
    else
      render :new
    end
  end

  def update
    @booking = current_user.bookings.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end
  

  def destroy
    @booking = current_user.bookings.find(params[:id])
    authorize @booking
    if @booking.destroy
      flash[:notice] = 'Your booking was cancelled successfully'
    else
      puts "Failed to destroy booking: #{@booking.errors.full_messages}"
      flash[:errors] = @booking.errors.full_messages
    end
    redirect_to booking_path(@booking)
  end

  private

  def process_date_range
    if params[:booking][:date_range].present?
      starts_at, ends_at = params[:booking][:date_range].split(" to ")
      params[:booking][:starts_at] = starts_at
      params[:booking][:ends_at] = ends_at
    end
  end
  
  def booking_params
    params.require(:booking).permit(:user_id, :car_id, :starts_at, :ends_at, :accepted)
  end
end
