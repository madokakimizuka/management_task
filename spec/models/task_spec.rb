require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @one = FactoryBot.create(:task, user: @user)
    @two = FactoryBot.create(:second_task, user: @user)
    @three = FactoryBot.create(:third_task, user: @user)
  end

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "titleが26文字以上ならバリデーションが通らない" do
    task = Task.new(title: 'a'*26, content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(title: '成功', content: 'テスト', user: @user)
    expect(task).to be_valid
  end

  it "title検索ができる" do
    params = {
      task: { title_key: "_02" }
    }
    @search = params[:task]
    expect(Task.title_search(@search[:title_key])[0].id).to be @two.id
  end

  it "status検索ができる" do
    params = {
      task: { status_key: 2 }
    }
    @enums = Task.statuses
    @search = params[:task]
    expect(Task.status_search(@search[:status_key]).size).to eq 2
  end
end



# step15 について質問した時の宮岡さんの作業
#   describe 'enumの検索テスト' do
#     before do
#       FactoryBot.create(:task, status: 0)
#       FactoryBot.create(:task, status: 1)
#       FactoryBot.create(:task, status: 2)
#       @enums = Task.statuses
#     end
#     it 'データが1件取得できる' do
#       params = {
#         task: {
#           status_search: "着手"
#         }
#       }
#     expect(Task.where('status = ?', @enums[params[:task][:status_search]]).size).to eq 1
#     end
#   end
