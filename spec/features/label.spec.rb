require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    @label = FactoryBot.create(:label)
    @label2 = FactoryBot.create(:second_label)
    @label3 = FactoryBot.create(:third_label)
    @user = FactoryBot.create(:user)
    visit new_session_path
    fill_in 'email', with: 'test1@example.com'
    fill_in 'password', with: 'password'
    click_on 'ログイン'
  end

  scenario "複数のラベルがついたタスクを作成するテスト" do
    visit new_task_path
    fill_in 'task', with: 'testtesttest'
    fill_in 'content', with: 'samplesample'
    check 'task_label_ids_1'
    check 'task_label_ids_3'
    click_on '作成'
    expect(page).to have_content 'タスクを作成しました'
  end

  scenario "つけたラベルをタスクの詳細画面で全て表示できるかのテスト" do
    visit new_task_path
    fill_in 'task', with: 'testtest'
    fill_in 'content', with: 'samplesamplesample'
    check 'task_label_ids_4'
    check 'task_label_ids_6'
    click_on '作成'
    expect(page).to have_content'label1'
    expect(page).to have_content'label3'
  end

  scenario "ラベルで検索できるかのテスト" do
    FactoryBot.create(:task, user: @user, labels: [@label2, @label3])
    visit root_path
    select 'label2', from: 'label_key'
    click_on '検索'
    expect(page).to have_content '_01'
  end
end
