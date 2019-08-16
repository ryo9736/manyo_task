# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
    background do
        Task.create!(task_name: '課題１', content: 'テスト')
      end

  scenario "タスク一覧のテスト" do

    visit tasks_path

    save_and_open_page

    expect(page).to have_content '課題１'
    expect(page).to have_content 'テスト'

  end

  scenario "タスク作成のテスト" do

    visit new_task_path

    fill_in 'task_task_name', with: '課題１'
    fill_in 'task_content', with: 'テスト'

    click_on 'Create Task'

    expect(page).to have_content '課題１'
    expect(page).to have_content 'テスト'
  end

  scenario "タスク詳細のテスト" do

    visit task_path(Task.last)

    expect(page).to have_content '課題１'
    expect(page).to have_content 'テスト'

  end
end