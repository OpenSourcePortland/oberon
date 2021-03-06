class PropertiesController < ApplicationController
  def index
    @properties = Property.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @property = Property.find(params[:id]) #, :include => :materials)
    @materials = @property.materials

    respond_to do |format|
      format.html 
    end
  end

  def new
    @property = Property.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def create
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
    end
  end
  
  def assign
   character = Character.first
   @property = Property.find(params[:id])

   if @property.character
     respond_to do |format|
       format.html { redirect_to @property.location, notice: 'This property is already claimed by another player!' }
     end
   else
     @property.character = character
     @property.save!
     respond_to do |format|
       format.html { redirect_to @property.location, notice: 'Bam, Success!' }
     end
    end
  end
  
end
