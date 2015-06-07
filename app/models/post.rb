class Post < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def message
    "#{user.name} volunteered at #{event.title}"
  end
end
