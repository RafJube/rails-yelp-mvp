puts "Start to create 5 restaurants"
category = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.category = category.sample
  restaurant.address = Faker::Address.full_address
  restaurant.phone_number = Faker::PhoneNumber.phone_number_with_country_code
  restaurant.save
  puts 'restaurant save'

  5.times do
    review = Review.new
    review.restaurant = restaurant
    review.content = Faker::Restaurant.review
    review.rating = (rand * 5).round(1)
    review.save
    puts 'review save'
  end
end

puts "End of restaurants's creation"
