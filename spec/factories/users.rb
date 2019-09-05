FactoryBot.define do

  factory :user do
    name { '111' }
    email { '1@1.com' }
    password { '111111' }
    password_confirmation {'111111'}
  end

  factory :second_user do
    name { '222' }
    email { '2@2.com' }
    password { '222222' }
    password_confirmation { '222222' }
  end

end
