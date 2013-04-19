class CharactersController < ApplicationController
  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
    @profile = @character.profile# || Profile.new
  end

  # POST /characters
  # POST /characters.json

  def create
    @character = Character.new(params[:character])
    @profile = Profile.new(params[:profile])
    #create_initial_ships

    respond_to do |format|

      if @character.save
        @profile.character_id = @character.id
        @profile.save!
        format.html { redirect_to dashboard_path, notice: 'Character was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find_by_id(1)
    
    #@character = Character.find(params[:id])
    @profile = @character.profile# || Profile.new

    respond_to do |format|
      if @character.update_attributes(params[:character])
        @profile.update_attributes((params[:profile]))
        format.html { redirect_to dashboard_path, notice: 'Bam! Sucess!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end
  
  def dashboard
    @character = Character.find_by_id(1)
  end
end
