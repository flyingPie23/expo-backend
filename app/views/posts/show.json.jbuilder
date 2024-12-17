json.extract! @post, :id, :title, :description,:meduim,  :created_at

json.user do
  json.extract! @post.user, :id, :name
end

json.comments @post.comments do |comment|
  json.extract! comment, :id, :content, :created_at, :user_id
end

json.photos @post.photos do |photo|
  json.photo_key photo.blob.key
end
