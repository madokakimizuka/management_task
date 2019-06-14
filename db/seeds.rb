50.times do |n|
  title = Faker::Games::Zelda.character
  content = Faker::Games::Zelda.item

  password = "password"
  Task.create!(title: title,
               content: content,
               )
end
