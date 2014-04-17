class ImagesController < ApplicationController
  def new
    @image = Image.new
  end
  def create
    @image = Image.new(image_params)
    @listing = Listing.find(params[:listing_id])
    if @image.save
      @listing.images << @image
      flash[:notice] = "Image Uploaded"
      redirect_to listing_path(@listing)
    else
      flash[:notice] = "Failure"
      render edit_listing_path(@listing)
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
