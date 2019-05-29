class WorksitesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @worksites = policy_scope(Worksite)
    @worksites = Worksite.where.not(latitude: nil, longitude: nil)
    distance = 150
    if params[:query].present? && params[:query][:localisation].present?
      @worksites = Worksite.near(params[:query][:localisation].split(',').first, distance)
      while @worksites.size < 3
        distance += 50
        @worksites = Worksite.near(params[:query][:localisation].split(',').first, distance)
      end
    else
      @worksites = Worksite.all
    end
    @markers = @worksites.map do |worksite|
      {
        lat: worksite.latitude,
        lng: worksite.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { worksite: worksite })
      }
    end
  end

  def my_worksites
    @worksites = current_user.worksites
    authorize @worksites
  end

  def show
    @worksite = Worksite.find(params[:id])
    authorize @worksite

    @markers =
      [{
        lat: @worksite.latitude,
        lng: @worksite.longitude
      }]

    @booking = Booking.new
  end

  def new
    @worksite = Worksite.new
    authorize @worksite
  end

  def create
    @worksite = Worksite.new(worksite_params)
    authorize @worksite
    @worksite.user = current_user
    if @worksite.save
      redirect_to @worksite
    else
      render :new
    end
  end

  def edit
    @worksite = Worksite.find(params[:id])
    authorize @worksite
  end

  def update
    @worksite = Worksite.find(params[:id])
    authorize @worksite
    @worksite.update(worksite_params)
    redirect_to worksite_path
  end

  def destroy
    @worksite = Worksite.find(params[:id])
    @worksite.destroy
    authorize @worksite
    redirect_to worksites_path
  end

private

  def worksite_params
    params.require(:worksite).permit(:name, :address, :description, :user_id, :photo)
  end

end



