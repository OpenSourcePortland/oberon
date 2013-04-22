class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  
  # Mark Review: Need help properly associating profile to character with has_one relationship
  def new
    @character = Character.find(params[:character_id])
    @profile = Profile.new
    @profile.character_id = @character.id
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
    end
  end
end
