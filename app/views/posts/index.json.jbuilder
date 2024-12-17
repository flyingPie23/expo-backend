json.array! @posts do |post|
  json.extract! post, :id, :title, :description, :meduim, :created_at

  json.user do
    json.extract! post.user, :id, :name
  end

  json.photos post.photos do |photo|
    json.photo_key photo.blob.key
  end

end
