class ListingsController < ApplicationController
  def index
    @query = params[:query]
    if params[:query] == nil
      @listing = Listing.all
    else
      @listing = Listing.search(params[:query])
    end
  end
  def new
    @listing = Listing.new
    @image = Image.new
  end

  def show
    @listing = Listing.find(params[:id])

    @event = Event.new
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    event_strips = Event.event_strips_for_month(@shown_month)
    @event_strips = []

      event_strips.each.with_index do |day, index|
        @event_strips << []

        #this looks at each day of the month
        day.each do |event|
          #this looks at the event for every day
        if event == nil
          @event_strips[index] << nil
        elsif event[:name] == @listing.title
          @event_strips[index] << event
        else
          @event_strips[index] << nil
      end
    end
    index += 1
      @event_strips
    end

    @image = Image.new


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
    params.require(:listing).permit(:price, :title, :location, :bedrooms, :bathrooms, :description, :user_id, :image, :query)
  end

end
