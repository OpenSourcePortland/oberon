class CharactersController < ApplicationController
  
  def index
    @characters = Character.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @character = Character.new
    @profile = Profile.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @character = Character.find(params[:id])
    @profile = @character.profile
  end


  def create
    @character = Character.new(params[:character])
    @profile = Profile.new(params[:profile])

    respond_to do |format|

      if @character.save
        @profile.character_id = @character.id
        @profile.save!
        format.html { redirect_to dashboard_path, notice: 'Character was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @character = Character.find_by_id(1)
    
    @profile = @character.profile

    respond_to do |format|
      if @character.update_attributes(params[:character])
        @profile.update_attributes((params[:profile]))
        format.html { redirect_to dashboard_path, notice: 'Bam! Sucess!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
    end
  end
  
  def dashboard
    @character = Character.find_by_id(1)
    @locations = Location.where("id != ?", @character.location.id)
  end
  
  def travel
    @character = Character.find params[:id]
    @destination = Location.find params[:dest_id]
    distance = params[:distance]
    if @character.ship.fly(distance)
      @character.travel(@destination)
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: 'Bam! Sucess!' }
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: "You don't have enough fuel" }
      end
    end
  end
end
