# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do

    FactoryBot.create(:task)
    FactoryBot.create(:second_task)

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

    fill_in 'task_task_name', with: '課題１'
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
    expect(task_0).to have_content "テスト2"
    
  end

  scenario "タスクが終了期限の降順に並んでいるかのテスト" do

    visit tasks_path

    click_on '終了期限でソートする'

    task = all('.task_list')

    task_0 = task[0]

    expect(task_0).to have_content "テスト2"

    save_and_open_page

  end
end