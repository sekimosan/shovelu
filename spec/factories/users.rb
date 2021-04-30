FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username(specifier: 1..10)}
    email   {Faker::Internet.unique.email}
    password       {"1a"+ Faker::Internet.password(min_length: 4)}
    password_confirmation    {password}
    user_name   {Faker::Lorem.unique.characters(number: 8..12,min_alpha:2,min_numeric:2)}
    gender_id   {Faker::Number.between(from: 1,to: 2)}
    age_id     {Faker::Number.between(from: 1,to: 10)}
    profile  {Faker::Lorem.paragraph(sentence_count:3)}
    
  end
end
