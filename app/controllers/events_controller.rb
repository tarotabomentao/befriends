class EventsController < ApplicationController
  def new
    @country = Country.find(params[:country_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
     redirect_to country_path(params[:country_id])
    else
      render :new
    end
  end

  def show
    @country = Country.find(params[:country_id])
    @event = Event.find(params[:id])
  end

  def edit
    @country = Country.find(params[:country_id])
    @event = Event.find(params[:id])
  end

  def update
    @country = Country.find(params[:country_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
     redirect_to country_event_path(@country, @event)
    else
      render :edit
    end
  end

  def destroy
    @country = Country.find(params[:country_id])
    @event = Event.find(params[:id])
    if @event.destroy
     redirect_to country_path(@country)
    else
      render :show
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :country_id, :category_id, :start_time, :end_time, :online, :place, :content, :image, user_ids:[]).merge(country_id: params[:country_id])
  end
end
