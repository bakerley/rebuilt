class WorksitesController < ApplicationController
  def index
    @worksites = Worksite.all.order(:start_date)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
