class User < ActiveRecord::Base
  has_many :user_tags
  has_many :professions, through: :user_tags, source: :tag, source_type: 'Profession'
  has_many :interests, through: :user_tags, source: :tag, source_type: 'Interest'
  has_many :skills, through: :user_tags, source: :tag, source_type: 'Skill'

  has_many :posts
  has_many :events
end
