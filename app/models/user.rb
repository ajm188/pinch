class User < ActiveRecord::Base
  has_many :professions
  has_many :interests
  has_many :skills

  has_many :posts
  has_many :events
end
