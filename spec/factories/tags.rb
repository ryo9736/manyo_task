FactoryBot.define do
  factory :tag, class:Tag do
    task_id { 1 }
    label_id { 1 }
  end

  factory :second_tag, class:Tag do
    task_id { 2 }
    label_id { 2 }
  end

end
