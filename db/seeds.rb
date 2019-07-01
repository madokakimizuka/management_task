User.create!(name: Faker::Color.color_name, email: Faker::Internet.email, admin: true, password: "password", password_confirmation: "password")

User.create!(name: Faker::Color.color_name, email: Faker::Internet.email, admin: false, password: "password", password_confirmation: "password")
