FactoryBot.define do

    factory :task do
      title { '課題1' }
      content { 'テスト1' }
      created_at{Time.zone.now}
      expired{Time.zone.now}
      status { '完了' }
      priority {'高'}
      user_id { User.last.id }
    end

    factory :second_task , class: Task do
      title { '課題2' }
      content { 'テスト2' }
      created_at{Time.zone.now+ 1.days}
      expired{Time.zone.now + 1.days}
      status { '着手中'}
      priority {'中'}
      user_id { User.last.id }
    end


  end
