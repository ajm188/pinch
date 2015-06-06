class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :professions
  has_many :interests
  has_many :skills

  has_many :posts
  has_many :events

  validates :name, presence: true, allow_blank: false
end
