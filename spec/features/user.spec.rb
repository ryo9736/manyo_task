
require 'rails_helper'

RSpec.feature "ユーザ登録機能", type: :feature do
    background do

      FactoryBot.create(:user)

    end

    scenario "ユーザ登録のテスト" do

      visit new_user_path

      fill_in 'user_name', with: '333'
      fill_in 'user_email', with: '3@3.com'
      fill_in 'user_password', with: '333333'
      fill_in 'user_password_confirmation', with: '333333'

      click_on 'アカウントを作成する'

      expect(page).to have_text '333'
      expect(page).to have_text '3@3.com'

    end

    scenario "ログイン状態ではないとタスク一覧ページに遷移ができないテスト" do

        visit tasks_path

        expect(page).to have_text'ログイン'

    end

    scenario "ログイン状態でユーザー登録画面に行かせないテスト" do

        visit new_session_path

        fill_in 'session_email', with: '1@1.com'
        fill_in 'session_password', with: '111111'

        click_on 'ログインする'

        visit new_user_path

        expect(page).to have_text'タスク一覧'

    end

    scenario "ログイン状態で他のユーザーの詳細ページに行かせないテスト" do

        visit new_user_path

        fill_in 'user_name', with: '333'
        fill_in 'user_email', with: '3@3.com'
        fill_in 'user_password', with: '333333'
        fill_in 'user_password_confirmation', with: '333333'

        click_on 'アカウントを作成する'

        visit user_path(User.first)

        expect(page).to have_text'タスク一覧'
    end

end

 #bin/rspec spec/features/user.spec.rb
#save_and_open_page