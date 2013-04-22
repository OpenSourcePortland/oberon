class ShipsController < ApplicationController
  def index
    @ships = Ship.all
    
    respond_to do |format|
      format.html 
    end
  end

  def show
    @ship = Ship.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    
    @ship = Ship.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def create
    @ship = Ship.new(params[:ship])

    respond_to do |format|
      if @ship.save
        format.html { redirect_to @ship, notice: 'Ship was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @ship = Ship.find(params[:id])

    respond_to do |format|
      if @ship.update_attributes(params[:ship])
        format.html { redirect_to @ship, notice: 'Ship was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy
    respond_to do |format|
      format.html { redirect_to ships_url } 
    end
  end
  
  def ship_store
    @ships = Ship.where(:character_id => nil)
  end
  
  def buy
    ship = Ship.find(params[:id])
    character = Character.first  #MARK REVIEW: should we do this through session?
    character_ship = ship.dup
    character_ship.character = character
    character_ship.save!
    
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "purchased ship #{ship.name}"} 
    end
    
  end
end
