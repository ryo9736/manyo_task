require 'rails_helper'

RSpec.feature "ユーザ管理機能", type: :feature do
  background do

    FactoryBot.create(:user)

  end

  before do

    visit new_session_path
    fill_in 'session_email', with: '1@1.com'
    fill_in 'session_password', with: '111111'
    click_on 'ログインする'

  end

  scenario "ユーザ作成のテスト" do

    visit new_admin_user_path

    fill_in 'user_name', with: '333'
    fill_in 'user_email', with: '3@3.com'
    fill_in 'user_password', with: '333333'
    fill_in 'user_password_confirmation', with: '333333'

    click_on 'アカウントを作成する'

    expect(page).to have_text '333'
    expect(page).to have_text '3@3.com'

  end

  scenario "ユーザ一覧のテスト" do

    visit admin_users_path

    expect(page).to have_text '111'

  end

  scenario "ユーザ詳細のテスト" do

    visit admin_user_path(User.first)

    expect(page).to have_text '111'

  end

  scenario "ユーザ編集のテスト" do

    visit edit_admin_user_path(User.first)

    fill_in 'user_name', with: '444'
    fill_in 'user_email', with: '4@4.com'
    fill_in 'user_password', with: '444444'
    fill_in 'user_password_confirmation', with: '444444'

    click_on 'アカウントを編集する'

    expect(page).to have_text '444'

  end

  scenario "ユーザ削除のテスト" do

    visit admin_users_path

    click_link '削除'

    expect(page).not_to have_text "1@1.com"

  end

end

#bin/rspec spec/features/admin.spec.rb
#save_and_open_page