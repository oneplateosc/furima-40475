# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.first_name }
    last_name { 'やマ田' }
    first_name { '太ろウ' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
  end
end
