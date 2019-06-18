50.times do |n|
  title = Faker::Games::Zelda.character
  content = Faker::Games::Zelda.item
  Task.create!(title: title,
               content: content,
               )
end

User.create(name: Faker::Color.color_name, email: Faker::Internet.email, password: "password", password_confirmation: "password")
