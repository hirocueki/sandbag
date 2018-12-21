# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# blog = Blog.create(name:"hoge hoge blog")
# post = blog.posts.create(title:"first", content: "my first post.")
# post.comments.create(body: "I like this post!")

require 'faker'
Faker::Config.locale = :ja


# generate 10 users
10.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: "password"
  )
end


user_first_id = User.first.id
user_last_id = User.last.id

def rand_user (first_id, last_id)
  User.where( 'id >= ?', rand(first_id..last_id) ).first
end

# 1blog , 10posts, 5comments
blog = Blog.create!(name:"hoge hoge blog", user: rand_user(user_first_id, user_last_id) )
10.times do
  post = blog.posts.create!(
    title: Faker::Lorem.word, 
    content: Faker::Lorem.sentence,
    user: blog.user)
  5.times do
    post.comments.create!(body:Faker::Lorem.sentence, user: rand_user(user_first_id, user_last_id))
  end
end
