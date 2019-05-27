class BookingsController < ApplicationController
  before_action :set_worksite, only: [:index, :new, :create]
  def index
    raise
    @worksite = policy_scope(Booking)
    @bookings = @worksite.bookings
  end

  def works
    @bookings = Booking.where(user_id: current_user.id)
    authorize @bookings
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def edit
  end

  def create
    @booking = Booking.new(bookings_params)
    authorize @booking
    @booking.user = current_user
    @booking.worksite = @worksite
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_worksite
    @worksite = Worksite.find(params[:worksite_id])
  end
end
