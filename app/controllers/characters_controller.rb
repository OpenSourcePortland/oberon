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
    @profile = @character.profile || Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.json
  
  
  # Mark Review: Help us, obi-wan.
  def create
    @character = Character.new(params[:character])
    @profile = Profile.new(params[:profile])

    respond_to do |format|

      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      @profile.character_id = @character.id
        
      if @profile.save
        format.html { redirect_to @character, notice: 'Profile was successfully created.' }
      end
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
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
end
