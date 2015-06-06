class Interest < ActiveRecord::Base
  has_many :user_interests

  validates :name, presence: true, uniqueness: true
end
