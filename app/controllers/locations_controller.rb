class LocationsController < ApplicationController
  def index
    @locations = Location.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @location = Location.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
    end
  end
end
