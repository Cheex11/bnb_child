class ImagesController < ApplicationController

  def index
    @listing = Listing.find(params[:listing_id])
    @images = @listing.images
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @image = Image.new(image_params)

    if @image.save
      @listing.images << @image
      flash[:notice] = "Image Uploaded"
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:notice] = "Failure"
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    @image.destroy
    redirect_to listing_path(@listing)
  end

  def image_params
    params.require(:image).permit(:photo, :listing_id)
  end
end
