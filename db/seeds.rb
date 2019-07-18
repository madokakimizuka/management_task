User.create!(name: Faker::Color.color_name, email: Faker::Internet.email, admin: true, password: "password", password_confirmation: "password")

User.create!(name: Faker::Color.color_name, email: Faker::Internet.email, admin: false, password: "password", password_confirmation: "password")

Label.create!(name: "金銭")
Label.create!(name: "仕事")
Label.create!(name: "勉強")
Label.create!(name: "家事")
Label.create!(name: "旅行")
Label.create!(name: "推し")
