class Profession < ActiveRecord::Base
  has_many :user_professions
end
