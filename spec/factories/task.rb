FactoryBot.define do
  factory :task do
    title { 'test_task_01' }
    content { 'testtesttest' }
    created_at { '2019-05-26 13:30:15 +0900' }
  end

  factory :second_task, class: Task do
    title { 'test_task_02' }
    content { 'samplesample' }
    created_at { '2019-06-26 13:30:15 +0900' }
  end
end
