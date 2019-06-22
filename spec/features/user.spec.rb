require 'rails_helper'

RSpec.feature "ログイン機能を実装したタスク管理機能", type: :feature do
  scenario "サインアップできるかのテスト" do
    visit new_user_path
    fill_in '名前', with:'user_a'
    fill_in 'メールアドレス', with:'a@example.com'
    fill_in 'パスワード', with:'password'
    fill_in '確認用パスワード', with:'password'
    click_on 'アカウント作成'
    expect(page).to have_content 'a@example.com'
  end

  scenario "ログインできるかのテスト" do
    FactoryBot.create(:user)
    visit new_session_path
    fill_in 'メールアドレス', with:'test1@example.com'
    fill_in 'パスワード', with:'password'
    click_on 'ログイン'
    expect(page).to have_content 'test1@example.com'
  end

end
