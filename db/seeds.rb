require 'faker'

puts "Cleaning Database"

Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating users and their posts:"

profile_picture = URI.parse("https://institutcommotions.com/wp-content/uploads/2018/05/blank-profile-picture-973460_960_720-1.png").open

10.times do
  user =User.create(
    email: Faker::Internet.email,
    password: "123456",

    name: Faker::Name.name,
    bio: Faker::Quote.yoda,
    birthday: Faker::Date.between(from: '1900-01-1', to: '2004-12-31')
  )

  user.photo.attach(io: profile_picture, filename: "nes.png", content_type: "image/png")
  user.save

  puts "#{User.last.name} has been created"
end

puts "#{User.count} have been created"

puts "Creating posts and linking them to users:"

content = [
    "https://plus.unsplash.com/premium_photo-1675813863340-b7e84c4a1fb0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1673288397237-11ab6ff6bee3?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1664640458839-000c310875fa?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1582201942930-53fea460eeeb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDI3fHx8ZW58MHx8fHx8",
    "https://images.unsplash.com/photo-1577083553180-732e5d4b2d39?q=80&w=1986&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1582201957622-3bb35d578ffe?q=80&w=2034&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1580136579585-48a5311ee2f7?q=80&w=2004&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
]

15.times do
  meduim = ["2d", "3d", "Canvas", "Degital"]

  post = Post.create(
    title: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: rand(5..25)),
    meduim: meduim.sample
  )

  photos = []

  content.each do |photo|
    URI.parse("https://institutcommotions.com/wp-content/uploads/2018/05/blank-profile-picture-973460_960_720-1.png").open
    photos << { io: URI.open(photo), filename: File.basename(URI.parse(photo).path), content_type: 'image/png' }
  end

  post.photos.attach(photos)
  post.user = User.order('RANDOM()').first
  post.save

  puts "Post titled '#{post.title}' has been created and linked to user #{post.user.name}"
end

puts "#{Post.count} have been created"

Post.all.each do |post|
  10.times do
    comment = Comment.create(content: Faker::Lorem.sentence(word_count: rand(5..25)))
    comment.user = User.order('RANDOM()').first
    comment.post = post
    comment.save

    puts "comment has been created by #{comment.user.name} on #{comment.post.title} "
  end
end

puts "#{Comment.count} have been created"
puts "Seed done"
