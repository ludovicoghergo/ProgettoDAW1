
#Cleaning database
Product.destroy_all
User.destroy_all
Comment.destroy_all

#Choosing titles
TITLES = %w[DESKTOP LAPTOP CASE RAM MEMORIES CARDS NETWORK NEW]
SEX = %w[MALE FEMALE]
STATE =%w[ITALIA SPAGNA MAROCCO FRANCIA GERMANIA RUSSIA]

# Create Products
10.times do |n|
  title = Faker::Lorem.word
  cost = rand(1..99)
  quantity = rand(1..99)
  description = Faker::Lorem.paragraph(sentence_count:30)

  Product.create!(
    title: title,
    category: TITLES.sample,
    description: description,
    price: cost,
    quantity: quantity
  )
end

# Create User
100.times do |n|

  User.create!(
     fname: Faker::Lorem.word,
     lname: Faker::Lorem.word,
     age: rand(18..99),
     sex: SEX.sample,
     username: Faker::Lorem.word,
     email:Faker::Lorem.word,
     password: 'ludo',
     state: STATE.sample,
     zip: rand(18..999),
     admin: false
)
end
#Create Comment
100.times do |n|
     Comment.create!(
       title: Faker::Lorem.word,
       text: Faker::Lorem.paragraph(sentence_count:30),
       user_id: rand(35..99),
       product_id: rand(1..10)
)
end
