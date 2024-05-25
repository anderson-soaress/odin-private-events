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

  def destroy
    @participate_event = ParticipateEvent.where(user_id: "#{params[:user_id]}", event_id: "#{params[:event_id]}").first
    @participate_event.destroy

    redirect_to "/users/#{current_user.id}", status: :see_other
  end
end
