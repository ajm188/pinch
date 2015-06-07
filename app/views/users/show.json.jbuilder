json.extract! @user, :name, :allow_contact
json.skills do
  json.array! @user.skills do |skill|
    json.id skill.id
    json.name skill.name
  end
end
json.interests do
  json.array! @user.interests do |interest|
    json.id interest.id
    json.name interest.name
  end
end
json.professions do
  json.array! @user.professions do |profession|
    json.id profession.id
    json.name profession.name
  end
end
