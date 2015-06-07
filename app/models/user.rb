class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_professions
  has_many :user_interests
  has_many :user_skills

  has_many :professions, through: :user_professions
  has_many :interests, through: :user_interests
  has_many :skills, through: :user_skills

  has_many :posts

  has_many :users_events
  has_many :events, through: :users_events

  belongs_to :non_profit

  validates :name, presence: true, allow_blank: false

  has_many :friendships
  # has_many :friends, through: :friends, source: :friend, inverse_of: :inverse_friends
  # has_many :inverse_friends, through: :friends, source: :user, inverse_of: :friends

  # def friends
  #   self.friends + self.inverse_friends
  # end

  def non_profit?
    non_profit_id.present?
  end
end
