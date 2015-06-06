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
  has_many :events

  validates :name, presence: true, allow_blank: false
end
