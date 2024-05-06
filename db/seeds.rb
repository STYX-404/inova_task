# frozen_string_literal: true

# FactoryBot.create_list(:post, 50_000, :with_reviews) # the most obvious way but too much database requests

=begin
 This is a better way to create the records,
 We trading of loading the database by creating 70_000 insert query (AT LEAST)
 With creating much less queries but loading the server memory a little by populating these hashes in memory.
 And this also will be much faster
=end

p "Building Users Hashes..."
users_hashes = FactoryBot.attributes_for_list(:user, 1_000)
p "Building Posts Hashes..."
posts_hashes = FactoryBot.attributes_for_list(:post, 50_000)
p "Building Reviews Hashes..."
reviews_hashes = FactoryBot.attributes_for_list(:review, 20_000)

posts_hashes.map! do |post|
  post.merge({user_id: rand(1..1000)})
end

reviews_hashes.map! do |review|
  review.merge({user_id: rand(1..1000), post_id: rand(1..50_000)})
end

p "Creating Users..."
User.insert_all(users_hashes)
p "Creating Posts..."
posts_hashes.in_groups_of(5_000) { |batch| Post.insert_all(batch) }
p "Creating Reviews..."
reviews_hashes.in_groups_of(5_000) { |batch| Review.insert_all(batch) }
