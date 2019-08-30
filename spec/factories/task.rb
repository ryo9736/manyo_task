FactoryBot.define do

    factory :task do
      title { '課題1' }
      content { 'テスト1' }
      created_at{Time.zone.now}
      sort_expired{Time.zone.now}
      status { '完了' }
    end

    factory :second_task, class: Task do
      title { '課題2' }
      content { 'テスト2' }
      created_at{Time.zone.now+ 1.days}
      sort_expired{Time.zone.now + 1.days}
      status { '着手中'}
    end


  end
