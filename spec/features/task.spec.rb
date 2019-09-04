
require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do

    FactoryBot.create(:user)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)

  end

  before do

    visit new_session_path
    fill_in 'session_email', with: '1@1.com'
    fill_in 'session_password', with: '111111'
    click_on 'ログインする'

  end

  scenario "タスク一覧のテスト" do

    visit tasks_path

    expect(page).to have_content '課題1'
    expect(page).to have_content 'テスト1'
    expect(page).to have_content '課題2'
    expect(page).to have_content 'テスト2'

  end

  scenario "タスク作成のテスト" do

    visit new_task_path

    fill_in 'task_title', with: '課題１'
    fill_in 'task_content', with: 'テスト1'

    click_on '登録する'

    expect(page).to have_content '課題１'
    expect(page).to have_content 'テスト1'
  end

  scenario "タスク詳細のテスト" do

    visit task_path(Task.last)

    expect(page).to have_content '課題2'
    expect(page).to have_content 'テスト2'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do

    visit tasks_path

    task = all('.task_list')

    task_0 = task[0]

    save_and_open_page

    expect(task_0).to have_content "課題2"

  end

  scenario "タスクが終了期限の降順に並んでいるかのテスト" do

    visit tasks_path

    click_on '終了期限でソートする'

    task = all('.task_list')
    task_0 = task[0]

    expect(task_0).to have_content "テスト2"


  end

  scenario "titleのみで絞りこみ検索した場合のテスト" do

    visit tasks_path

    fill_in 'task_title', with: '課題1'

    click_on '絞り込み検索'

    expect(page).to have_content '課題1'

  end

  scenario "statusのみで絞りこみ検索した場合のテスト" do

    visit tasks_path

    find("option[value='完了']").select_option

    click_on '絞り込み検索'

    save_and_open_page

    expect(page).to have_content '課題1'

  end

  scenario "titleとstatusで絞りこみ検索した場合のテスト" do

    visit tasks_path

    fill_in 'task_title', with: '課題2'

    find("option[value='着手中']").select_option

    click_on '絞り込み検索'

    save_and_open_page

    expect(page).to have_content 'テスト2'

  end

  scenario "優先順位を高い順にソートするテスト" do

    visit tasks_path

    click_on '優先順位で高い順にソートする'

    task = all('.task_list')
    task_0 = task[0]

    expect(task_0).to have_content "テスト1"

    save_and_open_page

  end

end

#bin/rspec spec/features/task.spec.rb
  #save_and_open_page
