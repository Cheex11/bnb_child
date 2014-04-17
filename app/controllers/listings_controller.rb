class ListingsController < ApplicationController
  def index
    @listing = Listing.all
  end
  def new
    @listing = Listing.new
    @image = Image.new
  end

  def show
    @image = Image.new
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @image = Image.new
   if @listing.save
      flash[:notice] = "Listing Added"
      redirect_to listing_path(@listing)
    else
      flash[:notice] = "Fail"
      render "new"
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    @image = Image.new
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Listing Updated"
      redirect_to :back
    else
      flash[:notice] = "Fail"
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to user_path(current_user)
  end

private

  def listing_params
    params.require(:listing).permit(:price, :title, :location, :bedrooms, :bathrooms, :description, :user_id, :image)
  end

end
