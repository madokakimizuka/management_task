require 'rails_helper'

RSpec.feature "管理画面実装後のテスト", type: :feature do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:admin_user)
    @test_user = FactoryBot.create(:sample_user)
    # (name: 'sample', email: 'admin2@example.com', password: 'password', password_confirmation: 'password')
    visit new_session_path
    fill_in 'email', with: 'admin@example.com'
    fill_in 'password', with: 'password'
    click_on 'ログイン'
  end

  scenario "ユーザー一覧画面を見れるかのテスト" do
    visit admin_users_path
    expect(page).to have_content 'テストユーザー'
  end

  scenario "ユーザーを作成できるかのテスト" do
    visit new_admin_user_path
    fill_in 'name', with: 'sample'
    fill_in 'email', with: 'sample@example.com'
    uncheck 'admin'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_on 'アカウント作成'
    expect(page).to have_content 'sample'
  end

  scenario "ユーザー詳細のテスト" do
    visit admin_user_path(@test_user.id)
    expect(page).to have_content 'admin2@example.com'
  end

  scenario "ユーザー編集のテスト" do
    visit edit_admin_user_path(@test_user.id)
    fill_in 'email', with: 'admin3@example.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_on 'ユーザー編集'
    expect(page).to have_content 'admin3@example.com'
  end

  scenario "ユーザー削除のテスト" do
    visit admin_users_path
    # tbody の中にある最初の削除をクリックする
    first('tbody tr').click_link '削除'
    expect(page).not_to have_content 'test1@example.com'
    expect(page).to have_content '削除しました'
  end
end
