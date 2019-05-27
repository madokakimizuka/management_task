require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  scenario "タスク一覧のテスト" do
    visit root_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task', with: 'testtesttest'
    fill_in 'content', with: 'samplesample'
    click_on '新規作成'
    expect(page).to have_content'testtesttest'
    expect(page).to have_content'samplesample'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(title: 'test_task_01', content: 'testtesttest')
    visit task_path(@task.id)
    expect(page).to have_content 'testtesttest'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit root_path
    # .はclass #id
    expect(
      all('.task-index__title').map(&:text)
    ).to eql Task.all.order(created_at: "DESC").map(&:title)
  end
end



# タスクが作成日時の降順に並んでいるかのテストについての解説
# before:
# b = []
# Task.all.order(created_at: "DESC").each do |task|
#   b.push(task.title)
# end

# after level 1
# b = Task.all.order(created_at: "DESC").map do |task|
#   task.id
# end

# after level 2 do end は1行で描きたいときは{ }
# b = Task.all.order(created_at: "DESC").map { |task| task.id }

# after level 3 値を一個ずつつ取り出してやるとき(&使う時は{}は()になる)
# b = Task.all.order(created_at: "DESC").map(&:id)
