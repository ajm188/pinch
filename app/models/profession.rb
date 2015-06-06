class Profession < ActiveRecord::Base
  has_many :user_professions

  validates :name, presence: true, uniqueness: true
end
