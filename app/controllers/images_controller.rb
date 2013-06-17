class ImagesController < ApplicationController
  before_filter :load_imageable

  def index
    @images = @imageable.images
  end

  def new
    @image = @imageable.images.new
  end
  
  def create
    @image = @imageable.images.new(params[:image])
    if @image.save
      redirect_to [@imageable, :images], notice: "Image created."
    else
      render :new
    end
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to [@imageable], notice: "Image deleted." }
    end
  end
  
private

  def load_imageable
    resource, id = request.path.split('/')[1,2]
    @imageable = resource.singularize.classify.constantize.find(id)
  end  
end
