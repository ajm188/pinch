class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(:non_profit).all
  end
end
