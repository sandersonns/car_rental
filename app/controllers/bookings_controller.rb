class BookingsController < ApplicationController
  before_action :authenticate_user!
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
    starts_at, ends_at = params[:booking][:date_range].split(" to ")
    @booking = current_user.bookings.build(booking_params.merge(starts_at: starts_at, ends_at: ends_at))
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update
    @booking = current_user.bookings.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
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
  
  def booking_params
    params.require(:booking).permit(:user_id, :car_id, :starts_at, :ends_at, :accepted)
  end
end
