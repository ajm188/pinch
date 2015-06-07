require 'byebug'
class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    if params[:user_id]
      @events = User.find(params[:user_id]).events
                    .where("start_time > ?", DateTime.now)
                    .order(start_time: :desc)
                    .limit(params[:count])
                    .includes(:non_profit)
                    .reverse
    else
      @events = Event.all
                    .order(start_time: :desc)
                    .limit(params[:count])
                    .includes(:non_profit)
                    .reverse
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
