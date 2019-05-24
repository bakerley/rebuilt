class WorksitesController < ApplicationController
  def index
    @worksites = Worksite.all
  end

  def show
    @worksite = Worksite.find(params[:id])
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
