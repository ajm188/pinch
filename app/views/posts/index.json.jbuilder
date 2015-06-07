json.posts @posts do |post|
  json.user do
    json.extract! post.user, :id, :name
  end
  json.event do
    json.extract! post.event, :id, :title
  end
  json.extract! post, :message, :created_at, :updated_at
end
