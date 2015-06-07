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

  def friends
    User.find_by_sql([<<-SQL, {user_id: self.id}])
      (select user_1_id as id from friendships
      where user_2_id = :user_id)
      union
      (select user_2_id as id from friendships
      where user_1_id = :user_id)
    SQL
  end

  def non_profit?
    non_profit_id.present?
  end
end
