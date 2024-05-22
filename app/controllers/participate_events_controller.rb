class ParticipateEventsController < ApplicationController

  def index 
    @participate_events = ParticipateEvent.all
  end

  def create 
    @participate_event = ParticipateEvent.new
    @participate_event.user_id = current_user.id
    @participate_event.event_id = params[:id]

    if @participate_event.save
      redirect_to "/events/#{params[:id]}"
    end
  end
end
