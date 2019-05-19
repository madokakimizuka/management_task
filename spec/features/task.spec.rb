require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_02', content: 'samplesample')
    visit root_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task', with: 'testtesttest'
    fill_in 'content', with: 'samplesample'
    click_on 'Create Task'
    expect(page).to have_content'testtesttest'
    expect(page).to have_content'samplesample'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(title: 'test_task_01', content: 'testtesttest')
    visit task_path(@task.id)
    expect(page).to have_content 'testtesttest'
  end
end
