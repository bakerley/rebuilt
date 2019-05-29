class BookingsController < ApplicationController
  before_action :set_worksite, only: [:index, :new, :create, :edit, :update]

  def index
    authorize @worksite
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

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(bookings_params)
    redirect_to my_bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    is_booker = @booking.user == current_user
    @booking.destroy
    if is_booker
      redirect_to my_bookings_path
    else
      redirect_to my_worksites_path
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_worksite
    @worksite = Worksite.find(params[:worksite_id])
  end
end

