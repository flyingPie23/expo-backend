json.array! @users do |user|
  json.extract! user, :id, :name, :bio, :birthday
  json.photo_key user.photo.key if user.photo.attached?
end
