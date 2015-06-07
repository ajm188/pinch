class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    if params[:user_id]
      @events = User.find(params[:user_id]).events
    else
      @events = Event.all
    end
    @events = @events.order(start_time: :desc)
                      .where("start_time > ?", DateTime.now)
                      .limit(params[:count])
                      .includes(:non_profit)
                      .reverse
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
