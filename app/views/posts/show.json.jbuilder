json.extract! @post, :id, :title, :description,:meduim,  :created_at

json.user do
  json.extract! @post.user, :id, :name
end
