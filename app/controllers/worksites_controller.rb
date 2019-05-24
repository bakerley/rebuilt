class WorksitesController < ApplicationController
  def index
    @worksites = Worksite.all
  end

  def show
  end

  def new
    @worksite = Worksite.new
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
