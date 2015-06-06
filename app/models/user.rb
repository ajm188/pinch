class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :professions
  has_many :interests
  has_many :skills

  has_many :posts

  has_many :users_events
  has_many :events, through: :users_events

  belongs_to :non_profit

  validates :name, presence: true, allow_blank: false

  def non_profit?
    non_profit_id.present?
  end
end
