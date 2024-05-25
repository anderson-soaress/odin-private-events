class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def show 
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(article_params)
    @event.creator_id = current_user.id

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(article_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to "/users/#{params[current_user.id]}"
  end

  private

  def article_params
    params.require(:event).permit(:title, :local, :date)
  end
end
