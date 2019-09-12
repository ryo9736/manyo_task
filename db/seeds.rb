User.create!(
  name: '管理者ユーザー',
  email: 'admin@test.com',
  password: '111111',
  admin: 'true'
  )

  10.times do |n|
    name = "ラベル#{n}"
  
    Label.create(
      name: name
    )
  end