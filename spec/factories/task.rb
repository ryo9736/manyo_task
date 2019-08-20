FactoryBot.define do

    factory :task do
      task_name { '課題1' }
      content { 'テスト1' }
      created_at{Time.zone.now}
      sort_expired{Time.zone.now}
    end

    factory :second_task, class: Task do
      task_name { '課題2' }
      content { 'テスト2' }
      created_at{Time.zone.now+ 1.days}
      sort_expired{Time.zone.now + 1.days}
    end
  end
