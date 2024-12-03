json.array! @users do |user|
  json.extract! user, :id, :name, :bio, :birthday
end
