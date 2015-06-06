class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(:non_profit).all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
