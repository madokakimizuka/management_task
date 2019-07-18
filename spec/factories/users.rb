FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test1@example.com" }
    admin { true }
    password { "password" }

    after(:create) do |user|
      user.tasks << FactoryBot.create(
        :task,
        title: 'test_task_01',
        content: 'testtesttest',
        deadline: DateTime.now + 10.days,
        status: 0,
        created_at: '2019-05-26 13:30:15 +0900',
        user_id: user.id,
      )
      user.tasks << FactoryBot.create(
        :task,
        title: 'test_task_02',
        content: 'samplesample',
        deadline: DateTime.now + 15.days,
        status: 2,
        created_at: '2019-06-26 13:30:15 +0900',
        user_id: user.id,
      )
      user.tasks << FactoryBot.create(
        :task,
        title: 'test_task_03',
        content: 'hogehogehoge',
        deadline: DateTime.now + 5.days,
        status: 2,
        created_at: '2019-04-26 13:30:15 +0900',
        user_id: user.id,
      )
    end
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
