require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    @user_a = FactoryBot.create(:user)
    FactoryBot.create(:task, user: @user_a)
    FactoryBot.create(:second_task, user: @user_a)
    FactoryBot.create(:third_task, user: @user_a)
    visit new_session_path
    fill_in 'email', with: 'test1@example.com'
    fill_in 'password', with: 'password'
    click_on 'ログイン'
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
    click_on '作成'
    expect(page).to have_content'testtesttest'
    expect(page).to have_content'samplesample'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(title: 'test_task_01', content: 'testtesttest', user: @user_a)
    visit task_path(@task.id)
    expect(page).to have_content 'testtesttest'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit root_path
    # .はclass #id
    expect(
      all('.task-index__title').map(&:text)
    ).to eql Task.order(created_at: "DESC").map(&:title)
  end

  scenario "タスクの終了期限が入力できるかのテスト" do
    visit new_task_path
    fill_in 'task', with: 'testtesttest'
    fill_in 'content', with: 'samplesample'
    fill_in 'deadline', with: DateTime.now
    click_on '作成'
    expect(page).to have_content '2019'
  end

  scenario "タスクの終了期限順にソートできるかのテスト" do
    visit root_path
    click_on '終了期限でソートする'
    expect(
      all('.task-index__title').map(&:text)
    ).to eql Task.order(deadline: "DESC").map(&:title)
  end

  scenario "タスクの検索ができるかのテスト" do
    visit root_path
    fill_in 'title_key', with: '_02'
    # selectボックスを選択する
    select '完了', from: 'status_key'
    click_on '検索'
    expect(page).to have_content 'samplesample'
    expect(page).not_to have_content 'hogehogehoge'
  end

  scenario "タスクが優先順位の高い順に並んでいるかのテスト" do
    visit root_path
    click_on '優先度の高い順にソートする'
    expect(
      all('.task-index__title').map(&:text)
    ).to eql Task.order(:priority).map(&:title)
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
