class Event < ActiveRecord::Base
  belongs_to :non_profit
  belongs_to :location

  has_many :users_events
  has_many :volunteers, through: :users_events, source: :user
end
