require 'rails_helper'

RSpec.feature "管理者機能", type: :feature do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:task)
    FactoryBot.create(:label)
    FactoryBot.create(:tag)
  end

  before do
    visit new_session_path
    fill_in 'session_email', with: '1@1.com'
    fill_in 'session_password', with: '111111'
    click_on 'ログインする'
  end

  scenario "詳細画面で、そのTaskに紐づいているLabel一覧を表示テスト" do

    visit tasks_path

    click_on '詳細'

    expect(page).to have_content 'ラベル１'
  end

end

# bin/rspec spec/features/label.spec.rb
#save_and_open_page
