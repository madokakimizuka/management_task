FactoryBot.define do
  factory :task do
    title { 'test_task_01' }
    content { 'testtesttest' }
    deadline { DateTime.now + 10.days }
    created_at { '2019-05-26 13:30:15 +0900' }
  end

  factory :second_task, class: Task do
    title { 'test_task_02' }
    content { 'samplesample' }
    deadline { DateTime.now + 15.days }
    created_at { '2019-06-26 13:30:15 +0900' }
  end

  factory :third_task, class: Task do
    title { 'test_task_03' }
    content { 'hogehogehoge' }
    deadline { DateTime.now + 5.days }
    created_at { '2019-04-26 13:30:15 +0900' }
  end
end
