require 'byebug'
class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    if params[:id]
      @events = User.find(params[:id]).events.includes(:non_profit)
    else
      @events = Event.all.includes(:non_profit)
    end
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
