FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test1@example.com" }
    admin { true }
    password { "password" }
  end

  factory :admin_user, class: User do
    name { "テスト管理ユーザー" }
    email { "admin@example.com" }
    admin { true }
    password { "password" }
  end

  factory :sample_user, class: User do
    name { "管理テスト2ユーザー" }
    email { "admin2@example.com" }
    admin { false }
    password { "password" }
  end
end
